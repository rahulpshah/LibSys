json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :book_id, :member_id
  json.url subscriber_url(subscriber, format: :json)
end
