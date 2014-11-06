class AddUrlToCatsubreddits < ActiveRecord::Migration
  def change
    add_column :catsubreddits, :url, :string
  end
end
