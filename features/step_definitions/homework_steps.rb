def make_homework(n, owner)
  homework = (1..n).map{Homework.make(:owner => owner)}
  homework.length.should == n
  homework.each {|h| h.should be_valid }
end

When /^(?:|I )create (\d+) pieces of homework$/ do |arg1|
  n = arg1.to_i
  make_homework(n, @current_account)
end

When /^(?:|I )create (\d+) pieces of homework by \"([^\"]*)\"$/ do |arg1, arg2|
  n = arg1.to_i
  owner = Account.make(:email => arg2)
  make_homework(n, owner)
end

Then /^(?:|I )should see (\d+) pieces of homework$/ do |arg1|
  #save_and_open_page
  n = arg1.to_i
  within('.content') do
    if n == 0
      page.should_not have_css(".homework")
    else
      page.should have_css(".homework", :count => n)
    end
  end
end
