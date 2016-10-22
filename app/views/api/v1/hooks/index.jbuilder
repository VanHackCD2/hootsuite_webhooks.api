json.hooks do
  json.array! @hooks do |hook|
    json.extract! hook, :id, :url
  end
end