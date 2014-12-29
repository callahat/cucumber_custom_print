Given /^I enter (.*) into google$/ do |search_term|
  @browser.goto "http://www.google.com"
  @browser.text_field(:id => "gbqfq").set "something"
end

When /^I run the search$/ do
  @browser.button(:id => "gbqfb").when_present.click

  Watir::Wait.until{ @browser.div(:id => "resultStats").exists? and @browser.h3s(:class => "r").map(&:text).size > 0}
end

Then /^I record results$/ do
  puts "Standard puts reporting on the results at time of test:"
  puts @browser.h3s(:class => "r").map(&:text).join("\n")
end

Then /^I record results with custom formatting$/ do
  puts "Custom method for writing information to the report (pretty formatter will show nothing - this method isn't added):"
  put_collapsible_list "Google results", @browser.h3s(:class => "r").map(&:text)
end
