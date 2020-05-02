class Vote < ApplicationRecord
  validates :userID, :restaurantID, :voteCast, presence: true
end
