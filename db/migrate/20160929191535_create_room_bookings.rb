class CreateRoomBookings < ActiveRecord::Migration
  def change
    create_table :room_bookings do |t|
      t.date :book_date
      t.time :in_time
      t.time :out_time
      t.integer :room_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
