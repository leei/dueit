class Member < ActiveRecord::Base
  belongs_to :account
  belongs_to :klass
end
