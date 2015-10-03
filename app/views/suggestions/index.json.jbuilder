json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :string, :string, :integer, :text
  json.url suggestion_url(suggestion, format: :json)
end
