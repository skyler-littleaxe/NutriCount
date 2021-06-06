class Log < ApplicationRecord
    belongs_to :user
    has_many :logmeals
    has_many :meals, through: :logmeals
    validates :date, presence: true
    validates :date, date: true
    validates :date, 
            date: { before_or_equal_to: Proc.new {Time.now} }
    

end
