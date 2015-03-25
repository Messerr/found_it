class PostCleanup < ActiveJob::Base
  queue_as :default
 
  def perform
    Post.each do |p|
    	p.destroy
    end
  end

  PostCleanup.perform.set(wait_until: 2.minutes).perform_later(record)
end