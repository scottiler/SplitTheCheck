class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :location, uniqueness: true
end
