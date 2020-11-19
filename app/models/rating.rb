class Rating < ApplicationRecord
  belongs_to :van
  validates :stars, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
