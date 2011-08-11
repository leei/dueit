require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  http { "http://" + Faker::Internet.domain_name + "/" +  Faker::Lorem.words(2).
join('/') }
  username  { Faker::Internet.user_name[0..15] }
  name { Faker::Lorem.words(2).join(' ') }
  email { Faker::Internet.email }
  text { Faker::Lorem.paragraphs.join("\n\n") }
  title { Faker::Lorem.words(8).join(' ') }
  password { Faker::Lorem.words(2).join }
end

Account.blueprint do
  email { Sham.email }
  password { "pass1234" }
  password_confirmation { self.password }
end

Homework.blueprint do
  name { Sham.name }
  criteria { Sham.text }
  owner { Account.make }
end
