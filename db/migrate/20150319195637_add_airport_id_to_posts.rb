class AddAirportIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :airport_id, :integer
  end
end
