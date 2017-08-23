class AddCoordinatesToHedgie < ActiveRecord::Migration[5.0]
  def change
    add_column :hedgies, :address, :string
    add_column :hedgies, :latitude, :float
    add_column :hedgies, :longitude, :float
  end
end
