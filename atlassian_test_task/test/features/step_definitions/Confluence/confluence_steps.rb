Given(/^I am logged to Confluence$/) do
  visit_page ConfluenceLoginPage
  on_page ConfluenceLoginPage do |page|
    page.email = 'b714106@trbvn.com'
    page.password = 'b714106@trbvn.com'
    page.submit
  end

  on_page ConfluenceDashboardPage do |page|
    page.has_expected_title?
   end
end

When(/^I create a new page$/) do
  @page_title = Faker::Name.title
  @page_body = Faker::Lorem.paragraphs(10, true)
  on_page ConfluenceDashboardPage do |page|
    page.create
    page.page_title = @page_title
    page.page_body =  @page_body
    page.save
  end
end

Then(/^I should see a new page$/) do
  on_page ConfluenceDashboardPage do |page|
    page.search = @page_title
    @browser.action.send_keys(:return).perform
  end
  raise "Unexpected page title: #{@browser.title}" unless @browser.title.include? @page_title
end

When(/^I change restrictions for page$/) do
  visit ConfluencePagePage
  on_page ConfluencePagePage do |page|
    page.action_menu
    page.permissions
  end
  options = ['No restrictions', 'Editing restricted', 'Viewing and editing restricted']

  @page = ConfluenceRestrictionsPage.new(@browser)
  @page.selector_element.when_visible.click # waiting while menu loading
    loop do
      @new_restrictions = options.sample
      break if @new_restrictions != @page.dialog_selector
    end
  # Click on new restriction option
  @browser.find_element(xpath: "//div/span[text() = '#{@new_restrictions}']").click
  @page.apply_element.focus
  @page.apply

end


Then(/^I verify that page has new restrictions$/) do

  visit ConfluencePagePage
  on_page ConfluencePagePage do |page|
    page.action_menu
    page.permissions
  end
  #sleep 2
  @page.chosen_element.when_visible
  raise  "Wrong page restrictions: #{@page.chosen}, instead of #{@new_restrictions}" unless @page.chosen == @new_restrictions
  @page.cancel_element.focus
  @page.cancel

end