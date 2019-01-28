# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = "password"
  user.password_confirmation = user.password

  user.save

  profile = Profile.new
  profile.username = Faker::Pokemon.name
  profile.user_id = user.id

  profile.save
end
