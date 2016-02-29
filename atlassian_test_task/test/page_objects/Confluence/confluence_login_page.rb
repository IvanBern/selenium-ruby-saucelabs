# Confluence
# Page Object
# Login page

class ConfluenceLoginPage
  include PageObject

  page_url 'https://b714106.atlassian.net/login'
  expected_title 'Atlassian Cloud'

  text_field(:email, id: 'username')
  text_field(:password, id: 'password')

  button(:submit, id: 'login')

end