class CreateJoinTableLogMeal < ActiveRecord::Migration[6.1]
  def change
    create_join_table :logs, :meals do |t|
      # t.index [:log_id, :meal_id]
      # t.index [:meal_id, :log_id]
    end
  end
end
