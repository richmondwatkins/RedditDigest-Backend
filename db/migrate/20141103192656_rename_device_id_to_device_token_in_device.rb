class RenameDeviceIdToDeviceTokenInDevice < ActiveRecord::Migration
  def change
    rename_column :devices, :deviceid, :deviceToken
  end
end
