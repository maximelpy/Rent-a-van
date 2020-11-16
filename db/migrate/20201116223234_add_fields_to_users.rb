class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :full_name, :string
    add_column :users, :owner, :boolean
  end
end
