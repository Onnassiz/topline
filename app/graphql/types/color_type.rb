module Types
  class ColorType < Types::BaseObject
    description "A color instance"
    field :color, String, null: true
  end
end