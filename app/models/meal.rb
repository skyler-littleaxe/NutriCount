class Meal < ApplicationRecord
    has_many :log_meals
    has_many :logs, through: :log_meals
    validates :meal_type, presence: true
    validates :meal_name, presence: true
    
end
