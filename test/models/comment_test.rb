require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "Comment attributes must not be empty" do
    comment = Comment.new
    assert comment.invalid?
    assert comment.errors[:userID].any?
    assert comment.errors[:restaurantID].any?
    assert comment.errors[:title].any?
    assert comment.errors[:content].any?
  end

  test "Comment is not valid without a unique location" do
    comment = Comment.new(content: comments(:one).content,
    userID: 1, restaurantID: 53, title: "good food")

    assert comment.invalid?
    assert_equal ["has already been taken"], comment.errors[:content]
  end
end
