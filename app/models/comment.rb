class Comment < ApplicationRecord
  validates :userID, :restaurantID, :title, :content, presence: true
  validates :content, uniqueness: true
#  belongs_to :user
#  belongs_to :restaurant
end
