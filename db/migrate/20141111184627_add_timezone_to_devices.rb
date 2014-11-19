class AddTimezoneToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :timeZone, :integer
  end
end
