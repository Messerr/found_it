class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :airport
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	validates :item, :description, :location, :question, :answer, :airport_id, presence: true

  	def self.delete_claimed
  		self.where(:status => 'Claimed').destroy_all
  	end
end
