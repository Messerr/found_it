class AddAnswerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :answer, :string
  end
end
