# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

20.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end

topics = Topic.all

200.times do
  
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end

posts = Post.all

100.times do

  Comment.create!(
      # user: users.sample,   # we have not yet associated Users with Comments
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

# Create a admin
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
  )
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Post.count} posts were created."
puts "#{Comment.count} comments were created."