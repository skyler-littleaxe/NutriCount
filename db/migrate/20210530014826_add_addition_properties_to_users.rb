class AddAdditionPropertiesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :goal, :string
    add_column :users, :weight, :integer
    add_column :users, :height, :integer
    add_column :users, :lifestyle, :string
  end
end
