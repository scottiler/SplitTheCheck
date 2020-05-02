class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :location, uniqueness: true

  belongs_to :user
  has_many :votes
  has_many :comments
end
