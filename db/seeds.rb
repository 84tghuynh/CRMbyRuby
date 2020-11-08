# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Customer.delete_all
AdminUser.delete_all

10.times do
  customer = Customer.create(
    fullname:    Faker::Name.unique.name,
    phonenumber: Faker::PhoneNumber.unique.cell_phone.to_s,
    email:       Faker::Internet.unique.email,
    notes:       Faker::Coffee.unique.notes
  )

  query = URI.encode_www_form_component([customer.fullname])
  downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
  customer.image.attach(io: downloaded_image, filename: "m-#{[customer.fullname]}.jpg")
end

puts "Created #{Customer.count} customers."

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
