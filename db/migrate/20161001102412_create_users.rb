class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :gender
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password
      t.string :salt
      t.string :md5
      t.string :sha1
      t.string :sha256
      t.timestamp :registered
      t.integer :dob
      t.string :phone
      t.string :cell  
      t.string :sha256
      t.string :PPS
    end
  end
end