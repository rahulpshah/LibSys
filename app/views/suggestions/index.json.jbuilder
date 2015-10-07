json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :isbn, :name, :authors, :description
  json.url suggestion_url(suggestion, format: :json)
end
