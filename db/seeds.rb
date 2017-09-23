# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create username: "fitbyamer_admin", password: "Amer123!@", password_confirmation: "Amer123!@", email: "amer_shboul@yahoo.com", role: 2

20.times{
  user = User.new username: FFaker::Internet.user_name, password: FFaker::Internet.password, email: FFaker::Internet.email, role: rand(0..1), locale: User::LOCALES.sample, phone_number: FFaker::PhoneNumber.phone_number, age: [20, 30, 40].sample, gender: [0,1].sample, height: [150, 160, 170, 180, 190].sample, weight: [70, 80, 90, 100, 110].sample, aim: ["lose weight", "gain weight", "build muscle"].sample
  user.remote_image_url = FFaker::Avatar.image
  p user.errors.full_messages unless user.save!
}
