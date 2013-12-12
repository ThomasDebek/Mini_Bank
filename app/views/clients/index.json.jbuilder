json.array!(@clients) do |client|
  json.extract! client, :id, :name, :surname, :email, :phone
  json.url client_url(client, format: :json)
end
