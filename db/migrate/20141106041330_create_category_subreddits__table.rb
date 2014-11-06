class CreateCategorySubredditsTable < ActiveRecord::Migration
  def change
    create_table :category_subreddits__tables do |t|
      t.string :name
      t.integer :category_id
    end
  end
end
