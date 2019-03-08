class CreateShirtSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :shirt_sizes do |t|
      t.belongs_to :shirt, foreign_key: true
      t.belongs_to :size, foreign_key: true

      t.timestamps
    end
  end
end
