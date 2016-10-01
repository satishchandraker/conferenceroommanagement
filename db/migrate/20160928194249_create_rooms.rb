class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :status, :default => true
      t.date :book_date
      t.time :in_time
      t.time :out_time
      t.date :reserve_date
      t.timestamps null: false
    end
  end
end