# Confluence
# Page Object
# Restrictions page
@new_restrictions = ''

class ConfluenceRestrictionsPage
  include PageObject

  div(:select_drop, id: 'select2-drop-mask')
  button(:selector, id: 's2id_page-restrictions-dialog-selector')
  button(:apply, id: 'page-restrictions-dialog-save-button')
  button(:cancel, id: 'page-restrictions-dialog-close-button')
  label(:chosen, xpath: './/span[@class=\'select2-chosen\']/div/span[@class=\'title\']')

  select_list(:dialog_selector, id: 'page-restrictions-dialog-selector')

end