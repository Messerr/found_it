class User < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
	acts_as_messageable
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"  }, :default_url => "/images/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	validates :fname, :lname, :email, :password, :bio, presence: true

  	def name 
  		fname
  	end

  	def mailboxer_email(object)
  		email
  	end

end
