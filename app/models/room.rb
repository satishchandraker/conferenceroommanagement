class Room < ActiveRecord::Base
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :room_facilities
  has_many :room_bookings
  accepts_nested_attributes_for :room_facilities, :allow_destroy => true  

  def self.search(params)
    rooms = Room.all.page(params[:page]).per(20)
    rooms = rooms.where("name like ?", "%#{params[:search]}%") if params["search"].present?
    rooms
  end
end
