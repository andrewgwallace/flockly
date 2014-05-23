class User < ActiveRecord::Base

  attr_writer :longitude, :latitude
  after_initialize :geocode
  after_update :geocode, :if => :address_changed?

  has_one :message
  has_one :location, through: :message

  attr_accessor :password
  before_save :encrypt_password



#WHYUNOWORK?
  validates_confirmation_of :password, :on => :create, :message => "Passwords should match"
  validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  validates_presence_of :email, :on => :create, :message => "Please enter an e-mail address"
  validates_uniqueness_of :email, :on => :create, :message => "Email address must be unique"



  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def geocode
    unless address.blank?
      coordinates = Geocoder.coordinates(address)
      self.latitude = coordinates[0]
      self.longitude = coordinates[1]
    end
  end

end

