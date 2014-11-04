class CreateSubredditTable < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.text :subreddit
    end
  end
end
