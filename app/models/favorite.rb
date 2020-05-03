class Favorite < ApplicationRecord
  validates :userID, :restaurantID, presence: true
  validates :userID, uniqueness: { scope: [:restaurantID] }
#belongs_to :user
end
