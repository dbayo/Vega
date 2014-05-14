json.array!(@cards) do |card|
  json.extract! card, :id, :name, :description, :genre
  json.url card_url(card, format: :json)
end
