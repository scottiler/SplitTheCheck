require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "Restaurant attributes must not be empty" do
    restaurant = Restaurant.new
    assert restaurant.invalid?
    assert restaurant.errors[:name].any?
    assert restaurant.errors[:location].any?
  end

  test "Restaurant is not valid without a unique location" do
    restaurant = Restaurant.new(location: restaurants(:bk).location,
    name: "Burger King")

    assert restaurant.invalid?
    assert_equal ["has already been taken"], restaurant.errors[:location]
  end


end
