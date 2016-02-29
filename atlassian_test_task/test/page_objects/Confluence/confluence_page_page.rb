# Confluence
# Page Object
# Page page

class ConfluencePagePage
  include PageObject

  page_url 'https://b714106.atlassian.net/wiki/display/S1/Restrictions+Test+Page'

  link(:action_menu, id: 'action-menu-link')
  link(:permissions, id: 'action-page-permissions-link')

  select_list(:select_restrictions, id: 'select2-drop-mask')

end