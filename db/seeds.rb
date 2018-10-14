# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Seed Users
user = {}
user['password'] = '123123123'
user['confirmation_token'] = '123123123'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['interests'] = ["Outdoors", "Technology", "Health", "Education", "Food & Drink", "Cycling", "Camping", "Scuba Diving", "Hiking", "Fishing", "Crypto", "E-Commerce", "SEO", "Startups", "Fitness", "Running", "Yoga", "Science", "Math", "Engineering", "Coffee", "Vegan"].sample(rand(1..5))

    User.create(user)
  end
end 

# Seed Events
event = {}
uids = []
User.all.each { |u| uids << u.id }
@participants = []
@users = User.all.each { |x| @participants << x.first_name }
@mood = ["Chill", "Fun", "Crazy"]

categories = {
    'Outdoors' => ['Cycling', 'Camping', 'Hiking', 'Fishing'],
    'Technology' => ['Crypto', 'SEO', 'E-Commerce'],
    'Health' => ['Fitness', 'Nutrition', 'Yoga'],
    'Education' => ['Math', 'Engineering', 'Science'],
    'Food & Drink' => ['Coffee', 'Vegan', 'Wine'],
}

selected_category = categories.keys.sample

ActiveRecord::Base.transaction do
  
    50.times do 
    event['title'] = Faker::App.name
    event['description'] = Faker::Lorem.paragraph(10, false, 15)
    event['category'] = categories.keys.sample
    event['sub_category'] = categories[selected_category].sample
    event['participants'] = @participants.sample(rand(2..15))
    event['mood'] = @mood.sample
    event['cost'] = rand(30..999)
    event['time'] = Faker::Time.forward(2, :all)
    event['user_id'] = uids.sample

    Event.create(event)
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"