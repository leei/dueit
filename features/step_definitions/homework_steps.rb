When /^(?:|I )create (\d+) pieces of homework$/ do |arg1|
  n = arg1.to_i
  owner = @current_account
  homework = (1..n).map{Homework.make(:owner => owner)}
  homework.length.should == n
  homework.each {|h| h.should be_valid }
end

Then /^(?:|I )should see (\d+) pieces of homework$/ do |arg1|
  #save_and_open_page
  within('.content') do
    page.should have_css(".homework", :count => arg1.to_i)
  end
end
