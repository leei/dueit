class Homework < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Account'

  validates :owner, :presence => true
  validates :name, :length => 3..140

  validates :deadline, :presence => true

  def how_soon
    soon = deadline - DateTime.current
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

  #
  # Any state other than "" or nil is considered done.
  def done?
    not state.blank?
  end
end
