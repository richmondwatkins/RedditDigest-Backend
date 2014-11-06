class ChangeCatsubnames < ActiveRecord::Migration
  def change
        rename_table :catsubreddit, :catsubreddits
  end
end
