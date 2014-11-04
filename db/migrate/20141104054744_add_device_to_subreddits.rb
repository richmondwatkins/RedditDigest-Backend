class AddDeviceToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :device_id, :integer
  end
end
