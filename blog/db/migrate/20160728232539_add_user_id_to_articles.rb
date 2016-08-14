class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :user, index: true
    add_foreign_key :articles, :users
  end
end
