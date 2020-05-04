require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase

  test "Favorite attributes must not be empty" do
    favorite = Favorite.new
    assert favorite.invalid?
    assert favorite.errors[:userID].any?
    assert favorite.errors[:restaurantID].any?
  end

  test "Favorite is not valid without a unique userID and restaurantID" do
    favorite = Favorite.new(userID: favorites(:test).userID,
    restaurantID: favorites(:test).restaurantID)

    assert favorite.invalid?
    assert_equal ["has already been taken"], favorite.errors[:userID]
  end
end
