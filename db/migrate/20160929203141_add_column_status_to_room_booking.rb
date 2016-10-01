class AddColumnStatusToRoomBooking < ActiveRecord::Migration
  def change
    add_column :room_bookings, :status, :string
  end
end
