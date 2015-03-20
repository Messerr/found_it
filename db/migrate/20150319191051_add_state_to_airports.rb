class AddStateToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :state, :string
  end
end
