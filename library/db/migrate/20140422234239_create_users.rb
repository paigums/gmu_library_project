class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_id
      t.string :password
      t.boolean :admin

      t.timestamps
    end
  end
end
