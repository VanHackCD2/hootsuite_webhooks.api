class Post < ApplicationRecord
	belongs_to :hook

	validates :message, presence: true
end
