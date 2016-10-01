class RoomsController < ApplicationController

  layout 'admin' , :except => ['index']
  before_filter :authenticate_admin, :except => ["index"]
  
  def index 
    @rooms = Room.search(params)
  end

  def admin_rooms
    @rooms = Room.all.page(params[:page]).per(20)
  end 
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_parameters)
    if @room.save
      redirect_to admin_rooms_path , :notice => 'Record Added Successfully'
    else
      render "new" 
    end
  end
  
  def download_rooms
    @rooms = Room.all
    respond_to do |format|
       format.html
       format.xls{send_data @rooms.to_xls}
    end
  end

  def edit
    @room = Room.find_by_id(params[:id])
  end
  
  def update
    @room = Room.find_by_id(params[:id])
    if @room.update(room_parameters)
      redirect_to admin_rooms_path , :notice => 'Record Added Successfully'
    else
      render :action => "edit"
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy if room.present?
    redirect_to admin_rooms_path
  end
  
  private
    def room_parameters
      params.require(:room).permit!
    end

end
