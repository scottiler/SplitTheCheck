class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :location, uniqueness: true

  belongs_to :user
  belongs_to :vote
end
