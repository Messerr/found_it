module PostsHelper
	
	def timestamp
		time_ago_in_words(set_comment.created_at) 
	end
end
