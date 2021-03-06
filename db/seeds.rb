# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザ
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  introduction = "こんにちは#{name}です。"
  sex = rand(2)

  if n < 4
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               self_introduction: introduction,
               sex: sex,
               img_name: open("#{Rails.root}/db/dummy_images/#{n+1}.jpg")
             )
  else
             User.create!(name:  name,
                          email: email,
                          password:              password,
                          password_confirmation: password,
                          self_introduction: introduction,
                          sex: sex,
                          img_name: open("#{Rails.root}/app/assets/images/rails.png")
                        )
  end
end

# マイクロポスト
users = User.order(:created_at).take(6)
30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
