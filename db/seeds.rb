# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["Beer", "Wine", "Full Bar", "Cocktails", "BBQ", "Mexican", "Pizza", "Indian"]

8.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, cell_number: Faker::PhoneNumber.unique.cell_phone, avatar: "test string", password: Faker::Internet.password)
end

100.times do 
  Provider.create(biz_name: Faker::Restaurant.name, tax_id: "test string", photo_id: "test string", website: Faker::Internet.url, yelp: Faker::Internet.url(host: 'yelp.com'), biz_phone: Faker::PhoneNumber.phone_number, category: categories.sample, user: User.all.sample)
end

beverage_bool = [true, false]
item_categs = ["Hamburger", "Tacos", "Tamales", "Ramen", "Pizza", "Cocktails", "Beer", "Wine", "Pho", "Korean", "Thai"]

1000.times do
  MenuItem.create(beverage: beverage_bool.sample, item_cat: item_categs.sample, provider_id: Provider.all.sample.id, img_url: "test string", description: Faker::GreekPhilosophers.quote, vegetarian: beverage_bool.sample, vegan: beverage_bool.sample)
end

1000.times do
  Event.create(provider: Provider.all.sample, edate: Faker::Date.forward(days: 23), title: Faker::GreekPhilosophers.name, description: Faker::GreekPhilosophers.quote)
end



