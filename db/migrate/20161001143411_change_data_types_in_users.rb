class ChangeDataTypesInUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :registered, :integer
  	change_column :users, :sha256, :text
  end
end
