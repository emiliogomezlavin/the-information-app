require "./app/models/user"
require "./app/models/token"
require "faker"


User.destroy_all

10.times do
  u = User.new
  u.name = Faker::Name.first_name
  u.marketing = true
  u.articles = true
  u.email = Faker::Internet.free_email
  Token.generate(u)
  u.good_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=" + u.token["nonce"]
  u.wrong_email_link = "http://localhost:3000/settings?email=error&nonce=" + u.token["nonce"]
  u.wrong_nonce_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=12345" 
  u.save
end

10.times do
  u = User.new
  u.name = Faker::Name.first_name
  u.articles = true
  u.email = Faker::Internet.free_email
  Token.generate(u)
  u.good_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=" + u.token["nonce"]
  u.wrong_email_link = "http://localhost:3000/settings?email=error&nonce=" + u.token["nonce"]
  u.wrong_nonce_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=12345" 
  u.save
end

10.times do
  u = User.new
  u.name = Faker::Name.first_name
  u.marketing = true
  u.digest = true
  u.email = Faker::Internet.free_email
  Token.generate(u)
  u.good_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=" + u.token["nonce"]
  u.wrong_email_link = "http://localhost:3000/settings?email=error&nonce=" + u.token["nonce"]
  u.wrong_nonce_link = "http://localhost:3000/settings?email=" + u.email + "&nonce=12345" 
  u.save
end