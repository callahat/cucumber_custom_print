require 'watir-webdriver'
require_relative 'extensions/custom_formating'

Before do
  @browser = Watir::Browser.new :firefox
end

After do
  @browser.close
end
