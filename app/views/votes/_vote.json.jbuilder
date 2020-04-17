json.extract! vote, :id, :userID, :restaurantID, :voteCast, :created_at, :updated_at
json.url vote_url(vote, format: :json)
