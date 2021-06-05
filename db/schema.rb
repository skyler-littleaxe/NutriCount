# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_04_211716) do

  create_table "logs", force: :cascade do |t|
    t.date "date"
    t.boolean "cheat_day"
    t.integer "cal_goal"
    t.integer "protein_goal"
    t.integer "carb_goal"
    t.integer "fat_goal"
    t.integer "water_goal"
    t.integer "sugar_goal"
    t.integer "cal_count"
    t.integer "protein_count"
    t.integer "carb_count"
    t.integer "fat_count"
    t.integer "water_count"
    t.integer "sugar_count"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "logs_meals", id: false, force: :cascade do |t|
    t.integer "log_id", null: false
    t.integer "meal_id", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "meal_type"
    t.string "meal_name"
    t.integer "cal_amount"
    t.integer "protein_amount"
    t.integer "carb_amount"
    t.integer "fat_amount"
    t.integer "water_amount"
    t.integer "sugar_amount"
    t.boolean "cheat_meal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "goal"
    t.integer "weight"
    t.integer "height"
    t.string "lifestyle"
    t.string "uid"
    t.string "provider"
  end

end
