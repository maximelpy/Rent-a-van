class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :owner, :boolean
    add_column :users, :driving_licence_year, :integer
  end
end
