class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t| 
      t.date :reserved_on
      t.date :due_on
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
