json.posts do
  json.array! @posts do |post|
    json.extract! post, :id, :message, :hook_id, :created_at
  end
end