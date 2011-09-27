class Klass < ActiveRecord::Base
  has_many :members
  has_many :accounts, :through => :members
end
