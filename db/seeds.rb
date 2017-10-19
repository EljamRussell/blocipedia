require 'random_data'

# Create admin user
User.create!(
  email:     'admin@test.com',
  password:  'helloworld',
  role:       2
)

# Create standard user
User.create!(
  email:    'standard@test.com',
  password: 'helloworld'
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'helloworld'
  )
end

User.all.each(&:confirm)

users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  Faker::Name.title,
    body:   RandomData.random_paragraph
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
