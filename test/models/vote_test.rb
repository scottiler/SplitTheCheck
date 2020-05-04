require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "Vote attributes must not be empty" do
    vote = Vote.new
    assert vote.invalid?
    assert vote.errors[:userID].any?
    assert vote.errors[:restaurantID].any?
    assert vote.errors[:voteCast].any?
  end
end
