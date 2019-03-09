module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false do
      description "An example field added by the generator"
    end

    def test_field
      "Hello World!"
    end

    field :brands, [Types::BrandType], null: false do
      description "gets all clothing brands"
      argument :brand_id, Int, required: false
    end

    def brands(brand_id: nil)
      if brand_id
        Brand.where(id: brand_id)
      else
        Brand.all
      end
    end

    field :shirts, [Types::ShirtType], null: false do
      description "gets all shirts"
    end

    def shirts
      Shirt.all
    end
  end
end
