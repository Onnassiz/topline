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
