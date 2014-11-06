class RenameCategoriesSubreddits < ActiveRecord::Migration
  def change
      rename_table :category_subreddits__tables, :category_subreddit
  end
end
