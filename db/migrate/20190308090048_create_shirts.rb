class CreateShirts < ActiveRecord::Migration[5.2]
  def change
    create_table :shirts do |t|
      t.string :name
      t.string :price
      t.boolean :in_stock
      t.belongs_to :brand, foreign_key: true

      t.timestamps
    end
  end
end
