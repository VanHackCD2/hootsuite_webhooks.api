json.post do
	json.extract! @post, :id, :message, :hook_id
end