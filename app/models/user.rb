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



# def address
#   address = "#{self.street}, #{self.city}, #{self.state}, #{self.zipcode}"
#   self.latitude = Geocoder.coordinates(address)[0]
#   self.longitude = Geocoder.coordinates(address)[1]
#   self.save
# end




  # # mixes in BCrypt modules, etc to existing model
  # include BCrypt

  # validation for unique email
  # validates(:email, { :uniqueness => true})
  # validates :email, uniqueness: true

  # # setter
  # def password= password_input
  #   # passes the password_input through BCrypt::Password and hashes it
  #   new_password_hash = Password.create(password_input)
  #   # new password hash written to database
  #   self.hash_password = new_password_hash
  #   self.hash_password
  # end

  # # getter
  # def password
  #   Password.new(self.hash_password)
  # end

  # # check's a password
  # def check_password(password_input)
  #   # does the password going in, match the DB pass?
  #   password_input == self.password
  # end

  # #
  # def self.authenticated?(email_input, password_input)
  #   # binding.pry
  #   user = User.find_by_email(email_input)
  #   if user && user.password == password_input
  #     puts "Authenticated!"
  #     return user
  #   else
  #     puts "Incorrect password entered."
  #     return nil
  #   end
  #   puts "Email address not found. Sign-up or click 'Try it out'"
  #   return nil
  # end


# end
