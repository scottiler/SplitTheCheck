json.extract! comment, :id, :userID, :restaurantID, :title, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
