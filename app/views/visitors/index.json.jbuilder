json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :age, :gender, :email, :zip
  json.url visitor_url(visitor, format: :json)
end
