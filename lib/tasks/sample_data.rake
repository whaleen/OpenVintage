namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_bottles
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Joshua Vaage",
                       email:    "joshuavaage@gmail.com",
                       password: "ph5s2d456789",
                       password_confirmation: "ph5s2d456789",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@openvintage.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_bottles
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.bottles.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end