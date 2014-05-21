# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'digest'

User.delete_all
Location.delete_all
Message.delete_all

gravatar_url = "http://www.gravatar.com/avatar/"
      # binding.pry
      #Temporary User Array



          # messages = []
10.times do
Message.create({
summary: "#{Faker::Lorem.sentence(1)}",
content: "#{Faker::Lorem.paragraphs(1)}"

})
# messages << new_message
end
all_messages = Message.all
          # binding.pry
          # users = []
10.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.free_email(name).gsub(/\s+/, "").downcase
  User.create({
    name: name,
    hash_password: "password123",
    email: email,
    gravatar_hash: gravatar_url + Digest::MD5.hexdigest(email.to_s),
    address: "10 E 2st Street, New York, NY 10010",
    message_id: all_messages.sample.id
    })

            # Check User's e-mail for validity
              # if new_user.valid?
              #   users << new_user
              # end
end




