require 'watir-webdriver'

PAGES = {
  "Instagram page" => "www.instagram.com"
}

Given(/^that I am on the (.*)$/) do |page|
  @browser.goto(PAGES[page])
end

When(/^I enter my credentials$/) do
  @browser.link(:href, '/accounts/login/').click
  @browser.text_field(:id, 'id_username').set 'vladimir_grigore'
  @browser.text_field(:id, 'id_password').set 'Instagram-12'
  @browser.button(:value, 'Log in').click
end

Then(/^I should be logged in$/) do
	@browser.div(:class, 'top-bar-right account-state').wait_until_present
  assert(@browser.div(:class, 'top-bar-right account-state').text.include? 'vladimir_grigore')
end