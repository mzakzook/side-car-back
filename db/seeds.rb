# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# categories = ["Beer", "Wine", "Full Bar", "Cocktails", "BBQ", "Mexican", "Pizza", "Indian"]

food_placeholder_images = ['https://rfsdelivers.com/media/zoo/images/07-02-barbacoa-beef-street-tacos_63120b9e05f99470e104562c019a9455.jpg', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190208-delish-ramen-horizontal-093-1550096715.jpg?crop=1xw:0.9995002498750624xh;center,top&resize=480:*', 'https://travelfoodatlas.com/wp-content/uploads/2019/01/Hawaiian-Ahi-Poke-1.jpg', 'https://ichef.bbci.co.uk/wwfeatures/live/624_351/images/live/p0/7c/j8/p07cj8zj.jpg']

bev_placeholder_images = ['https://images.absolutdrinks.com/drink-images/Raw/Absolut/939c2560-08d9-4df7-a28c-f80d9780e08d.jpg?imwidth=500', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-957892610-1554995400.jpg?resize=980:*', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/25/0/CCWM_Pina-Colada-2_s3x4.jpg.rend.hgtvcom.826.620.suffix/1562077390568.jpeg', 'https://www.culinaryhill.com/wp-content/uploads/2018/08/Mojito-Cocktail-HR10-Culinary-Hill-660x865.jpg']

8.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, cell_number: Faker::PhoneNumber.unique.cell_phone, avatar: "test string", password: Faker::Internet.password)
end

50.times do 
  Provider.create(biz_name: Faker::Restaurant.name, tax_id: "test string", placeholder_image: food_placeholder_images.sample, website: Faker::Internet.url, yelp: Faker::Internet.url(host: 'yelp.com'), biz_phone: Faker::PhoneNumber.phone_number, category: "Food Truck", user: User.all.sample)
end

50.times do 
  Provider.create(biz_name: Faker::Restaurant.name, tax_id: "test string", placeholder_image: bev_placeholder_images.sample, website: Faker::Internet.url, yelp: Faker::Internet.url(host: 'yelp.com'), biz_phone: Faker::PhoneNumber.phone_number, category: 'Bartending', user: User.all.sample)
end


beverage_bool = [true, false]
item_categs = ["Hamburger", "Tacos", "Tamales", "Ramen", "Pizza", "Cocktails", "Beer", "Wine", "Pho", "Korean", "Thai"]

1000.times do
  MenuItem.create(beverage: beverage_bool.sample, item_cat: item_categs.sample, provider_id: Provider.all.sample.id, img_url: "test string", description: Faker::GreekPhilosophers.quote, vegetarian: beverage_bool.sample, vegan: beverage_bool.sample)
end

1000.times do
  Event.create(provider: Provider.all.sample, edate: Faker::Date.forward(days: 23), title: Faker::GreekPhilosophers.name, description: Faker::GreekPhilosophers.quote)
end



