require 'watir-webdriver'

BROWSER = Watir::Browser.new :chrome

PAGES = {
	"Instagram page" => "www.instagram.com"
}

Given(/^that I am on the (.*)$/) do |page|
  BROWSER.goto(PAGES[page])
end

When(/^I enter my credentials$/) do
  BROWSER.link(:href, '/accounts/login/').click
  BROWSER.text_field(:id, 'id_username').set 'vladimir_grigore'
  BROWSER.text_field(:id, 'id_password').set 'Instagram-12'
  BROWSER.button(:value, 'Log in').click
end

Then(/^I should be logged in$/) do
	BROWSER.div(:class, 'top-bar-right account-state').wait_until_present
  assert(BROWSER.div(:class, 'top-bar-right account-state').text.include? 'vladimir_grigore')
end