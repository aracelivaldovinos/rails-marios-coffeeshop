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
User.destroy_all



users_list = [
  [true, 'Araceli Valdovinos', 'araceli_admin', 'email@testing.com', 'password' ],
  [true, 'Admin', 'admin', 'admin@testing.com', 'password' ]
]

users_list.each do |a, b, c, d, e|
  User.create!( admin: a, full_name: b, username: c, email: d, password: e)
end

products_list = [
  ['Chocolate Roast', '24.55', 'United States'],
  ['Lovely Dove', '13.62', 'United States'],
  ['Prickly Pear', '55.31', 'United States']
]

products_list.each do |a, b, c|
  Product.create!( name: a, cost: b, country_of_origin: c)
end


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

