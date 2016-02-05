json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer, :votes, :vote_ratio
  json.url answer_url(answer, format: :json)
end
