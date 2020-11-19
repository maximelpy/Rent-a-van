class ChangeColumnApprovedDefaultToBookings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :approved, false
  end
end
