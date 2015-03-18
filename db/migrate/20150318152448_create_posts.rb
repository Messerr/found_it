class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :item
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
