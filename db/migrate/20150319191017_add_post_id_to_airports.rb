class AddPostIdToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :post_id, :integer
  end
end
