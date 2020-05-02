class Comment < ApplicationRecord
  validates :userID, :restaurantID, :title, :content, presence: true

#  belongs_to :user
#  belongs_to :restaurant
end
