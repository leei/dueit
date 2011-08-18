class Homework < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Account'

  validates :owner, :presence => true
  validates :name, :length => 3..140

  validates :deadline, :presence => true
end
