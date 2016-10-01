class RoomBooking < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  validates :book_date, :in_time, :out_time, :presence => true 
  validate :book_date_valid
  validate :in_time_valid
  validate :out_time_valid
  after_save :send_message

  STATUS = ['waiting','confirm']

  def book_date_valid
    if self.book_date.nil?
      errors.add(:book_date, "Invalid Date")
    elsif self.book_date < Date.today  
      errors.add(:book_date, "Date Can't Be Previous")
    elsif (self.room.reserve_date == self.book_date)
      errors.add(:book_date, "Holiday")
    end
  end

  def out_time_valid
    if self.in_time.utc.strftime("%H%M%S") == self.out_time.utc.strftime("%H%M%S")
      errors.add(:out_time, "Both Time are same.")
    end
  end  

  def in_time_valid
    if self.in_time.utc.strftime("%H%M%S") == self.out_time.utc.strftime("%H%M%S")
      errors.add(:in_time, "Both Time are same.")
    end
  end

  def set_status
    self.status = STATUS.second
    booking = self.room.room_bookings.where("status !=?", "waiting")
    val = booking.where('in_time >= ? AND out_time <= ?', self.in_time, self.out_time) if booking.present? rescue [] 
    if booking.present? and val.present?
      self.status = STATUS.first
    end
  end
  private
    def send_message
        UserMailer.welcome_email(self.user.email).deliver
  end
end