class PostDestroyer
  include Sidekiq::Worker

  def destroy_post
  	post = Post.where(Post.status == "Claimed")
 	post.destroy
  end
end


PostDestroyer.perform_in(2.minutes)
