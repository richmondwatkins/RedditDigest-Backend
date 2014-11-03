class AddPhoneIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :phoneId, :string
  end
end
