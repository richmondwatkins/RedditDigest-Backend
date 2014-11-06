class ChangeCatsubname < ActiveRecord::Migration
  def change
    rename_table :category_subreddits, :catsubreddit
  end
end
