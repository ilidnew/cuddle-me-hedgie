class AddAttrToHedgies < ActiveRecord::Migration[5.0]
  def change
    add_column :hedgies, :toy, :boolean, default: false
    add_column :hedgies, :food, :boolean, default: false
    add_column :hedgies, :bed, :boolean, default: false
    add_column :hedgies, :comb, :boolean, default: false
    add_column :hedgies, :poo, :boolean, default: false
    add_column :hedgies, :bowl, :boolean, default: false
  end
end
