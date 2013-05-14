PAGES = {
  "Instagram page" => "www.instagram.com"
}

Given(/^that I am on the (.*)$/) do |page|
  @browser.goto(PAGES[page])
  assert(@browser.div(:class, 'tab-content').text.include? 'Meet Instagram')
  @browser.link(:href, '/accounts/login/').click
end

When(/^I enter my credentials$/) do
  @browser.text_field(:id, 'id_username').set 'vladimir_grigore'
  @browser.text_field(:id, 'id_password').set 'Instagram-12'
  @browser.button(:value, 'Log in').click
end

Then(/^I should be logged in$/) do
	@browser.div(:class, 'top-bar-right account-state').wait_until_present
  assert(@browser.div(:class, 'top-bar-right account-state').text.include? 'vladimir_grigore')
  @browser.div(:class, 'top-bar-right account-state').link.click
  @browser.div(:class, 'dropdown').link(:index, 3).click
end

When(/^I enter an incorrect (.*) and (.*)$/) do |username, password|
  @browser.text_field(:id, 'id_username').set username
  @browser.text_field(:id, 'id_password').set password
  @browser.button(:value, 'Log in').click
end

Then(/^the login should fail$/) do
  assert(@browser.div(:id, 'alerts').text.include? 'Please enter a correct username and password.')
end