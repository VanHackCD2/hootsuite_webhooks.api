json.hooks do
  json.array! @hooks do |hook|
    json.extract! hook, :id, :url

    json.posts do
      json.array! hook.posts do |post|
        json.extract! post, :id, :message, :hook_id
      end
    end
  end
end