class AddQuestionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :question, :string
  end
end
