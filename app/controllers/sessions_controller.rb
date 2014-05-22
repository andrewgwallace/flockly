class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to :new_message
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end


def login

end

  def process_login
    email = params[:email]
    password = params[:password]

    @current_user = User.authenticated?(email, password)

    if @current_user
      # @current_user.logged_in = true
      # @current_user.save
      redirect_to 'messages/new'
    else
      render text: "Invalid email or password.  Please try again."
    end
  end

  def destroy
    # @current_user.logged_in = false
    # # current_user.message.location.destroy
    # # current_user.message.destroy
    # # location.message.id = nil
    # @current_user.save
    session[:user_id] = nil

    redirect_to login_url, :notice => "You are now logged out."
  end

end
