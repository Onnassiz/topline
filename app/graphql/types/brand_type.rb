module Types
  class BrandType < Types::BaseObject
    description "A clothing brand"

    field :id, ID, null: true
    field :name, String, null: true
    field :number_of_items, String, null: true
    field :country, String, null: true

    field :shirts, [ShirtType], null: true, method: :shirt

    def number_of_items
      object.shirt.size
    end
  end
end
