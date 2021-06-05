class Meal < ApplicationRecord
    has_many :logmeals
    has_many :logs, through: :logmeals
    validates :meal_type, presence: true
    validates :meal_name, presence: true
    
end
