class Message < ActiveRecord::Base

  attr_reader :latitude, :longitude


  belongs_to :user
  has_one :location

  # include WillPaginate

  # has_many :user

  # def distance_to(user)     #### MOVED TO LOCATION MODEL. PROBABALY SHOULD DELETE
  #   # binding.pry
  #   user_location = user.message.location
  #   Geocoder::Calculations.distance_between([user_location.get_latitude, user_location.get_longitude], [self.location.get_latitude, self.location.get_longitude])
  # end

end
