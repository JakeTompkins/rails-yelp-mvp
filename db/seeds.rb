# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting restaurants"
Restaurant.delete_all
puts "Creating restaurants"

10.times do
  r = Restaurant.new
  r.name = Faker::SiliconValley.company
  r.address = Faker::Address.street_address
  r.phone_number = Faker::PhoneNumber.phone_number
  r.category = %w[chinese italian japanese french belgian].sample.capitalize
  r.save
  5.times do
    rev = Review.new
    rev.content = Faker::FamilyGuy.quote
    rev.rating = (0..5).to_a.sample
    rev.restaurant = r
    rev.save
  end

end

puts "Created #{Restaurant.count} restaurants"
