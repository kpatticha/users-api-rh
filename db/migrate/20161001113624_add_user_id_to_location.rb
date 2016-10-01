class AddUserIdToLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :user, index: true
  end
end
