class Airport < ActiveRecord::Base
	belongs_to :posts
	has_many :posts
end
