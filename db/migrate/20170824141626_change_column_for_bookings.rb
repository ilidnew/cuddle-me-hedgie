class ChangeColumnForBookings < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bookings, :status, from: "", to: "pending"
  end
end
