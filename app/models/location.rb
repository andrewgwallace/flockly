class Location < ActiveRecord::Base

  belongs_to :message
  belongs_to :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?

  def get_latitude
    self.latitude.round(4)
  end


  def get_longitude
    self.longitude.round(4)
  end



  def distance_to(user = current_user)
    #returns distance to user that is input.
    user_location = user.location
    return Geocoder::Calculations.distance_between([user_location.get_latitude, user_location.get_longitude], [self.get_latitude, self.get_longitude])
  end

end
