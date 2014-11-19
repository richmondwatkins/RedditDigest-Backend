class ChangeDeviceToken < ActiveRecord::Migration
  def change
        rename_column :devices, :deviceToken, :device_token
  end
end
