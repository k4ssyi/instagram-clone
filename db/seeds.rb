# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  introduction = "こんにちは#{name}です。"
  sex = rand(2)

  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               self_introduction: introduction,
               sex: sex)
end

4.times do |n|
  User.find(n+1).update_column(:img_name, "#{n+1}.jpg")
end

users = User.order(:created_at).take(6)
30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
