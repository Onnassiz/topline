class AddImageLinkAndTotalItemToShirts < ActiveRecord::Migration[5.2]
  def change
    add_column :shirts, :image_link, :string
    add_column :shirts, :total_item, :integer
  end
end
