class Airport < ActiveRecord::Base
	belongs_to :posts
	has_many :posts
	validates :name, :state, presence: true
end
