
100.times do 
  Product.create(title: Faker::Book.title,
                content: Faker::Book.title,
                price: rand(100..10000))
end