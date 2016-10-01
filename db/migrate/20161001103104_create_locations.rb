class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
