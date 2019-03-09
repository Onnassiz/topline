# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brand_data = Array.new(10) {
  { name: Faker::Company.name, country: Faker::Address.country }
}

Brand.create(brand_data) if Brand.count.zero?

sizes = %w(XM SM M L XL 2XL 3XL).map { |size| { size: size } }

Size.create(sizes) if Size.count.zero?

colors = Array.new(10) { { color: Faker::Color.hex_color } }

Color.create(colors) if Color.count.zero?

if Shirt.count.zero?
  100.times do |n|
    brand_id = rand(1...10)
    size_max = rand(1..7)
    shirt = {
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      in_stock: [true, false].sample,
      brand_id: brand_id,
    }

    Shirt.create(shirt)

    color_ids = (1..10).to_a.sort { rand - 0.5 }[0..brand_id]
    shirts_colors = color_ids.map { |k| { shirt_id: n + 1, color_id: k } }

    size_ids = (1..7).to_a.sort { rand - 0.5 }[0..size_max]
    shirts_sizes = size_ids.map { |k| { shirt_id: n + 1, size_id: k } }

    ShirtColor.create(shirts_colors)
    ShirtSize.create(shirts_sizes)
  end
end

image_links = [
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282463/Custom-Art-Samples-Maroon-1024x1024_cyvuq1.png",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282463/iSPA-04-800x1199_oylvqu.png",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/green_1024x1024_nifhlm.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/997101-Array_wa3p5g.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/sample-sale-mens-t-shirt-droogs-clockwork_q0plnp.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/samples-men-s-jersey-t-shirt_jdq3lb.webp",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/portland_sqgrn8.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282461/t-191_1377658736805_r0xlub.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282460/images_man_tdit6y.jpg",
  "https://res.cloudinary.com/onnassiz/image/upload/v1552282706/we-shall-overcomb-white_980_heather-dark-grey_1024x1024_wbcues.jpg"
]

if Shirt.first.image_link.nil?
  100.times do |n|
    c = Shirt.find(n + 1);
    c.image_link = image_links[rand(0..9)]
    c.total_item = rand(5..100)
    c.save
  end
end
