require 'faker'

puts 'Destroying all existing users...'
User.destroy_all

puts 'Creating 20 users...'
20.times do
  new_user = User.create(
    username: Faker::Internet.username,
    password: 'password',
    email: Faker::Internet.email
  )
  puts "Created user with username = #{new_user.username}"
  puts "Creating Mobfriend for user..."
  new_mobfriend = Mobfriend.create(
    user: new_user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    tagline: Faker::TvShows::HowIMetYourMother.quote[0..150],
    bio: Faker::Hipster.paragraphs(number: 2).join(' '),
    age: rand(20..70),
    gender: %w(male female).sample,
    language: %w(english chinese malay tamil).sample,
    photo_url: 'https://source.unsplash.com/600x400/?person,face',
    hourly_rate: rand(5..30)
  )
  p new_mobfriend
end
