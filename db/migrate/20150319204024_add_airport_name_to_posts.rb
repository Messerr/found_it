class AddAirportNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :airport_name, :string
  end
end
