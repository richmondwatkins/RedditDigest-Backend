class ChangeDeviceColumnName < ActiveRecord::Migration
  def change
    rename_column :devices, :phoneId, :phoneid
  end
end
