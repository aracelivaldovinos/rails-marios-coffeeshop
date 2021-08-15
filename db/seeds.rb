# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Product.destroy_all
Review.destroy_all

10.times do |item|
  user = User.create!(
    full_name: Faker::Name.name, 
    username: Faker::Hipster.word, 
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
  5.times do |item|
    product = Product.create!(
      name: Faker::Coffee.blend_name,
      cost: Faker::Number.decimal(l_digits: 2),
      country_of_origin: Faker::Address.country
      )
    5.times do |item|
    review = product.reviews.create!(
      author: Faker::Name.name, 
      content_body: Faker::Lorem.sentence(word_count: 20),
      rating: Faker::Number.within(range: 1..5), product_id: product.id, user_id: user.id
      )
    end 
  end
end  

