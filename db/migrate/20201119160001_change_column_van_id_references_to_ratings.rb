class ChangeColumnVanIdReferencesToRatings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ratings, :user, index: true, foreign_key: true
    add_reference :ratings, :van, index: true, foreign_key: true
  end
end
