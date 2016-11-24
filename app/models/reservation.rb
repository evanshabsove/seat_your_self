class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :date, :time, presence: true
  validate :available
  # validates :seats, numericality: {:less_than_or_equal_to => :available, message: "CUSTOM ERROR MESSAGE"}

 def available
   if self.seats <= 0
     errors.add(:seats, "You must reserve at least one seat")
   elsif available_capacity < self.seats
     errors.add(:seats, "There is not a reservation available for your party at this time")
   end
 end


 def available_capacity
   restaurant.max_seats - self.reservations_now.sum(:seats)
 end

 def reservations_now
   self.restaurant.reservations.where(time: self.time..(self.time+1)).where(date: self.date)
 end


end
