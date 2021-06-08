class Log < ApplicationRecord
    belongs_to :user
    has_many :logmeals
    has_many :meals, through: :logmeals
    validates :date, presence: true
    validates :date, date: true
    validates :date, 
            date: { before_or_equal_to: Proc.new {Time.now} }
    accepts_nested_attributes_for :meals

    def meals_attributes=(meal_attributes)
        meal_attributes.values.each do |meal_attribute|
            if meal_attribute["meal_name"].present?
                meal = Meal.find_or_create_by(meal_attribute)
                self.meals << meal
            end
        end
    end
    

end
