class Hook < ApplicationRecord
	validates :url, presence: true, length: { minimum: 5 }, uniqueness: true
	#validates_format_of :url, with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
end
