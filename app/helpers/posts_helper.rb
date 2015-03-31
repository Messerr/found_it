module PostsHelper
	
	def timestamp
		time_ago_in_words(set_comment.created_at) 
	end

	def delete_claimed
  		p = Post.where(:status => 'Claimed')
  		p.destroy
  	end
end
