require 'faker'
require 'date'

puts 'Destroying all existing users...'
User.destroy_all
puts 'Creating 20 users...'
20.times do
  new_user = User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 'password'
  )
  puts "Created user with username = #{new_user.username}"
end

puts 'Destroying all existing events...'
Event.destroy_all
puts 'Creating 10 events...'
10.times do
  event = Event.new(
    datetime: DateTime.now,
    event_type: 'wedding',
    description: 'big event',
    event_location: 'Singapore',
    meeting_location: 'Fullerton',
    confirmed: false,
    user: User.all.sample
    )
  event.save
end
