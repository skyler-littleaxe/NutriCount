class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.date :date
      t.boolean :cheat_day
      t.integer :cal_goal
      t.integer :protien_goal
      t.integer :carb_goal
      t.integer :fat_goal
      t.integer :water_goal
      t.integer :sugar_goal
      t.integer :cal_count
      t.integer :protien_count
      t.integer :carb_count
      t.integer :fat_count
      t.integer :water_count
      t.integer :sugar_count

      t.timestamps
    end
  end
end
