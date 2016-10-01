class RoomBookingsController < ApplicationController

  
  before_filter :check_user, :except => ["admin_room_bookings", 'index']
  before_filter :find_room, :except => ["admin_room_bookings"]

  def index 
    binding.pry
    if current_user.manager
      @room_bookings = @room.room_bookings.page(params[:page]).per(20)
    else
      @room_bookings = current_user.room_bookings.page(params[:page]).per(20)
    end
  end

  def admin_room_bookings
    @room_bookings = RoomBooking.all.page(params[:page]).per(20)
  end 
  
  def new
    if @room.nil?
      redirect_to rooms_path
    end
    @room_booking = @room.room_bookings.new
  end

  def create
    @room_booking = @room.room_bookings.new(room_booking_parameters)
    @room_booking.user_id = current_user.id
    @room_booking.set_status
    if @room_booking.save
      redirect_to room_room_bookings_path(@room) , :notice => 'Record Added Successfully'
    else
      render "new" 
    end
  end
  
  def download_room_bookings
    @room_bookings = RoomBooking.all
    respond_to do |format|
       format.html
       format.xls{send_data @room_bookings.to_xls}
    end
  end

  def edit
    @room_booking = @room.room_bookings.find_by_id(params[:id])
  end
  
  def update
    @room_booking = @room.room_bookings.find_by_id(params[:id])
    @room_booking.set_status
    if @room_booking.update(room_booking_parameters)
      redirect_to room_room_bookings_path(@room), :notice => 'Record Added Successfully'
    else
      render :action => "edit"
    end
  end
  
  def show
    @room_booking = RoomBooking.find(params[:id])
  end

  def destroy
    room_booking = RoomBooking.find(params[:id])
    room_booking.destroy if room_booking.present?
    redirect_to admin_room_bookings_path
  end
  
  def find_room
    @room = Room.find_by_id(params[:room_id])    
    if @room.nil?
      redirect_to rooms_path
    end
  end

  def check_user
    if current_user.nil?
      redirect_to rooms_path
    end
  end

  private
  
    def room_booking_parameters
      params.require(:room_booking).permit!
    end
end
