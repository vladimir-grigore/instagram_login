require 'watir-webdriver'

case ENV['BROWSER']
  when 'ie', 'Internet Explorer'
    browser = Watir::Browser.new :ie

  when 'ff', 'Firefox'
    browser = Watir::Browser.new :ff
  when 'chrome'
    browser = Watir::Browser.new :chrome
  else
    browser = Watir::Browser.new :chrome
end

Before do
  @browser = browser
  @browser.cookies.clear
end

at_exit do
  browser.close
end