json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :name, :key, :compare, :format, :sortable
  json.url attribute_url(attribute, format: :json)
end
