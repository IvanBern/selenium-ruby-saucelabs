require 'selenium-webdriver'
require 'cucumber'
require 'page-object'
require 'faker'

# Extend Cucumber Methods
World PageObject::PageFactory

# Load Page Objects
require_relative('../../page_objects/pageobjects_lib')
