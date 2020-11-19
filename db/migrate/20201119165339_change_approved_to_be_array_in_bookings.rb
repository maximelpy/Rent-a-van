class ChangeApprovedToBeArrayInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :approved, :string
    change_column_default :bookings, :approved, "pending"
  end
end
