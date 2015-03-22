FactoryGirl.define do
  factory :post do
    title "Post title"
    body "Post body must be long."
    user
    topic { Topic.create(name: "Topic title") }
  end
end