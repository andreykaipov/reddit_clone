# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: "andrey", 
             password: "password", 
             password_confirmation: "password",
             admin: true)

99.times do
  username  = Faker::Internet.user_name(nil, %w(- _))
  password = "password"
  User.create(username:              username,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.microposts.create(content: content)
  end
end