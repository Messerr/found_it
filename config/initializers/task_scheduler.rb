scheduler = Rufus::Scheduler.start_new

scheduler.every("1m") do
	post = Post.where(Post.status == "Claimed")
	post.destroy
end 