module Types
  class ShirtType < Types::BaseObject
    description "A shirt instance"

    field :id, Int, null: true
    field :name, String, null: true
    field :price, String, null: true
    field :in_stock, Boolean, null: true
    field :image_link, String, null: true
    field :total_item, Int, null: true
    field :brand_id, ID, null: true

    field :brand, BrandType, null: true
    field :colors, [String], null: true, method: :color
    field :sizes, [String], null: true

    def colors
      object.color.map(&:color)
    end
  end
end
