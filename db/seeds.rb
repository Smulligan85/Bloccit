# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

50.times do
  
  Post.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    )
end

Post.create!(
    title: "Faker unique post title",
    body: "This is the text for the unique faker post."
  )

posts = Post.all

100.times do

  Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

  Comment.create!(
    post: posts.sample,
    body: "This is the unique faker comment."
    )


puts "Seeds finished"
puts "#{Post.count} posts were created."
puts "#{Comment.count} comments were created."