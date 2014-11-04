class AddUrlToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :url, :string
  end
end
