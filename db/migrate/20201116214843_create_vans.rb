class CreateVans < ActiveRecord::Migration[6.0]
  def change
    create_table :vans do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.boolean :booked
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
