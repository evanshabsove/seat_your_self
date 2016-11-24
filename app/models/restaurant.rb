class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  belongs_to :owner, class_name: "User"
  has_many :pictures

  validates :name, :location, :cuisine, :open_time, :close_time, :price, presence: true
  validates :max_seats, numericality: {only_integer: true}

  def self.search(search, location, cuisine, price)
    if search
        @found_restaurants = Restaurant.where('name LIKE ? AND location LIKE ? AND cuisine LIKE ? AND price = ?',  "%#{search}%", "%#{location}%", "%#{cuisine}%", price)
    else
        @found_restaurants = Restaurant.all
    end
  end

  def self.search_sans_price(search, location, cuisine)
    if search
        @found_restaurants = Restaurant.where('name LIKE ? AND location LIKE ? AND cuisine LIKE ?',  "%#{search}%", "%#{location}%", "%#{cuisine}%")
    else
        @found_restaurants = Restaurant.all
    end
  end


end
