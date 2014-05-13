class CreateUsers < ActiveRecord::Migration
  def change
  	drop_table :users
  	
    create_table :users do |t|
      t.string :name
      t.string :user_id
      t.boolean :admin
      t.string :password_digest

      t.timestamps
    end
  end
end
