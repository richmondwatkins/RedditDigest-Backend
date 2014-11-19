class ChangeTimeZoneToTimeZone < ActiveRecord::Migration
  def change
    rename_column :devices, :timeZone, :time_zone
  end
end
