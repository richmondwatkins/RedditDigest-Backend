class ChangePHoneIdType < ActiveRecord::Migration
  def change
      change_column :devices, :phoneid, :string
  end
end
