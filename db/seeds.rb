require 'faker'
require 'date'

puts 'Destroying all existing users...'
User.destroy_all
puts 'Creating 20 users...'
20.times do
  new_user = User.new(
    username: Faker::Internet.username,
    password: 'password'
  )
  puts "Created user with username = #{new_user.username}"
end

puts 'Destroying all existing users...'
Event.destroy_all
puts 'Creating 10 events...'
10.times do
  Event.create(
    datetime: DateTime.now,
    type: 'wedding',
    description: 'big event',
    event_location: 'Singapore',
    meeting_location: 'Fullerton',
    confirmed: false
    )
end
