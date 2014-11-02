class AddDeviceIdToWelcome < ActiveRecord::Migration
  def change
    create_table :deviceId do |t|
      t.string  :deviceId
    end
  end
end
