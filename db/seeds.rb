# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

5.times do
  Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::Number.leading_zero_number(digits: 10), category: "french")
end

15.times do
  Review.create!(content: Faker::Cannabis.brand, rating: 4, restaurant_id: rand(1..5))
end
