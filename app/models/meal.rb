class Meal < ApplicationRecord
    has_many :logmeals
    has_many :logs, through: :logmeals
end
