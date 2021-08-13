# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Product.destroy_all


50.times do
  Product.create!(
    name: Faker::Coffee.blend_name,
    cost: Faker::Number.decimal(l_digits: 2),
    country_of_origin: Faker::Address.country,
    id: Faker::Number.unique.between(from: 1, to: 50)
)
User.create!(
    full_name: Faker::Name.name, 
    username: Faker::Hipster.word,
    email: Faker::Internet.email, 
    password: Faker::Number.number(digits: 10) #=> 1968353479
  )
end 

250.times do 
  Review.create!(
    author: Faker::Name.name, 
    content_body: Faker::Lorem.sentence(word_count: 20),
    rating: Faker::Number.within(range: 1..5),
    product_id: Faker::Number.between(from: 1, to: 50),
    user_id: Faker::Number.between(from: 1, to: 50)
  )
end 

# 50.times do 
#   User.create!(
#     full_name: Faker::Name.name, 
#     username: Faker::Hipster.word,
#     email: Faker::Internet.email 
#   )
# end 