# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(username: "andrey", 
             password: "password", 
             password_confirmation: "password",
             admin: true)

21.times do
  username  = Faker::Internet.user_name(nil, %w(- _))
  password = "password"
  User.create(username:              username,
               password:              password,
               password_confirmation: password)
end

# Microposts
users = User.order(:created_at).take(6)
47.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.microposts.create(content: content)
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }