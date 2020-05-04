require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite = favorites(:one)
    @user = users(:two)
  end

  test "should get index" do
    get favorites_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_url
    assert_response :success
  end

  test "should destroy favorite" do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@favorite)
    end

    assert_redirected_to favorites_url
  end

  test "should add favorite" do
    assert_difference('Favorite.count', 1) do
    addFavorite_path(53)
    end
    assert_redirected_to restaurants_url
  end
end
