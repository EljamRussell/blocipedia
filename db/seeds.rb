require 'random_data'

# Create Users
5.times do
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end

# Create admin user
1.times do
  User.create!(
  email:     'eljamrussell@gmail.com',
  password:  'helloworld',
  role:       2
  )
end

# Create standard user
1.times do
  User.create!(
  email:    'eljamrussell@gmail.com',
  password: 'helloworld'
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
wikis = Wikis.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
