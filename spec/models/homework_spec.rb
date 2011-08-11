require 'spec_helper'

describe Homework do
  describe "creating" do
    before(:each) do
      @attrs = Homework.plan
      @account = @attrs[:owner]
    end

    specify "should succeed with valid attributes" do
      Homework.create(@attrs).should be_valid
    end

    specify "should fail without an owner" do
      Homework.create(@attrs.merge(:owner => nil)).should_not be_valid
    end

    specify "should fail with empty name" do
      Homework.create(@attrs.merge(:name => "")).should_not be_valid
    end
  end
end
