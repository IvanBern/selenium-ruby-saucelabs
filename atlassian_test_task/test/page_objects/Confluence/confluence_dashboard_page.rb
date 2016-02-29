# Confluence
# Page Object
# Login page

class ConfluenceDashboardPage
  include PageObject

  page_url 'https://b714106.atlassian.net/wiki#all-updates'
  expected_title 'Dashboard - Confluence'


  button(:create, id: 'quick-create-page-button')
  button(:save, id: 'rte-button-publish')

  text_field(:page_title, id: 'content-title')
  text_field(:search, id: 'quick-search-query')

  in_iframe(:id => 'wysiwygTextarea_ifr') do |frame|
    text_field(:page_body, id: 'tinymce', :frame => frame)
  end


end