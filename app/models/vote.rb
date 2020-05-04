class Vote < ApplicationRecord
  validates :userID, :restaurantID, :voteCast, presence: true

  #belongs_to :users
  #belongs_to :restaurants
end
