def make_homework(n, attrs)
  homework = (1..n).map{Homework.make(attrs)}
  homework.length.should == n
  homework.each {|h| h.should be_valid }
end

Given /^I have (\d+) pieces of homework$/ do |arg1|
  When "I create #{arg1} pieces of homework"
end

When /^(?:|I )create (\d+) piece(?:|s) of homework$/ do |arg1|
  n = arg1.to_i
  make_homework(n, :owner => @current_account)
end

When /^(?:|I )create (\d+) piece(?:|s) of homework (?:|named \"([^\"]*)\" )due on \"([^\"]*)\"$/ do |arg1, name, date|
  n = arg1.to_i
  attrs = {
    :owner => @current_account, 
    :deadline => date
  }
  attrs[:name] = name unless name.blank?
  make_homework(n, attrs)
end

When /^(?:|I )create (\d+) piece(?:|s) of homework by \"([^\"]*)\"$/ do |arg1, arg2|
  n = arg1.to_i
  owner = Account.make(:email => arg2)
  make_homework(n, :owner => owner)
end

Then /^I should see \"([^\"]*)\" before \"([^\"]*)\"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^(?:|I )should see (\d+) piece(?:|s) of (?:|(.*) )homework$/ do |arg1, state|
  #save_and_open_page
  n = arg1.to_i
  css = ".homework"
  if not state.blank?
    css += "[state=\"#{state}\"]"
  end
  within('.content') do
    if n == 0
      page.should_not have_css(css)
    else
      page.should have_css(css, :count => n)
    end
  end
end
