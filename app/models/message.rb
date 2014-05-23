class Message < ActiveRecord::Base

  attr_reader :latitude, :longitude


  belongs_to :user
  has_one :location


end
