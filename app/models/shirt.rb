class Shirt < ApplicationRecord
  belongs_to :brand
  has_many :shirt_size
  has_many :shirt_color
  has_many :size, through: :shirt_size
  has_many :color, through: :shirt_color

  def sizes
    size.map(&:size)
  end
end
