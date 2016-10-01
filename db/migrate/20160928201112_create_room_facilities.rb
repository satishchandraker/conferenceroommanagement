class CreateRoomFacilities < ActiveRecord::Migration
  def change
    create_table :room_facilities do |t|
      t.text :name
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
