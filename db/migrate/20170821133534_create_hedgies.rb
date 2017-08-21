class CreateHedgies < ActiveRecord::Migration[5.0]
  def change
    create_table :hedgies do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :min_booking
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
