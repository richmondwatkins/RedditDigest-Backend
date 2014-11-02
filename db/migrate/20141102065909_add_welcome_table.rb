class AddWelcomeTable < ActiveRecord::Migration
  def change
     create_table :devices do |t|
      t.string :deviceid
      t.timestamps
    end
  end
end
