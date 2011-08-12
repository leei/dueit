Given /^an account with email "(.*)"$/ do |email|
  Account.make(:email => email, :password => email, :password_confirmation => email)
end

Given /^I am signed in$/ do
  Given 'an account with email "leei@sociologi.ca"'
  When 'I sign in as "leei@sociologi.ca"'
  Then 'I should be signed in'
end

Given /^I am not signed in$/ do
  visit "/"
  within("#header") do
    if page.has_content?("Sign off")
      click_link("Sign off")
    end
  end
end

When /^I sign in as \"([^\"]*)\"$/ do |arg1|
  steps %Q{
    When I go to the new account session page
    And I fill in "account_email" with "#{arg1}"
    And I fill in "account_password" with "#{arg1}"
    And I press "Sign in"
  }
end

When /^I sign off$/ do
  steps %Q{
    When I go to the home page
    Then I should see "Sign off" within "#header"
    When I follow "Sign off" within "#header"
  }
end

Then /^I should be signed in$/ do
  within("#header") do
    page.should have_content("Signed in as")
  end
end

Then /^I should not be signed in$/ do
  within("#header") do
    page.should_not have_content("Signed in as")
  end
end
