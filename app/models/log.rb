class Log < ApplicationRecord
    belongs_to :user
    has_many :logmeals
    has_many :meals, through: :logmeals
end
