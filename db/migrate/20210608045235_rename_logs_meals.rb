class RenameLogsMeals < ActiveRecord::Migration[6.1]
  def change
    rename_table :logs_meals, :log_meals
  end
end
