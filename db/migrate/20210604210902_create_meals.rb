class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :meal_type
      t.string :meal_name
      t.integer :cal_amount
      t.integer :protien_amount
      t.integer :carb_amount
      t.integer :fat_amount
      t.integer :water_amount
      t.integer :sugar_amount
      t.boolean :cheat_meal

      t.timestamps
    end
  end
end
