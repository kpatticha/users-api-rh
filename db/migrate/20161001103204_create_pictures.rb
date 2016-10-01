class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
    	t.belongs_to :user, index: true
      t.text :large
      t.text :medium
      t.string :thumbnail
    end
  end
end
