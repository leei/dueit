class Homework < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Account'

  validates :owner, :presence => true
  validates :name, :length => 3..140

  validates :deadline, :presence => true

  def how_soon
    soon = deadline - Date.now
    if soon < 0
      :overdue
    elsif soon < 1.day
      :tomorrow
    elsif soon < 2.days
      :two_days
    elsif soon < 1.week
      :week
    else
      :not_yet
    end
  end
end
