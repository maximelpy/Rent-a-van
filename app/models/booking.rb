class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  validates :approved, inclusion: { in: ["pending", "approved", "rejected"] }
end
