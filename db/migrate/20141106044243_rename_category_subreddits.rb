class RenameCategorySubreddits < ActiveRecord::Migration
  def change
        rename_table :category_subreddit, :category_subreddits
  end
end
