
Then /^I should see a class named "([^"]*)"$/ do |name|
  within(".class h1") do
    page.should have_content(name)
  end
end