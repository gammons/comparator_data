json.array!(@items) do |item|
  json.extract! item, :id, :attributes
  json.url item_url(item, format: :json)
end
