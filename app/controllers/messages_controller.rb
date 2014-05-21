class MessagesController < ApplicationController

  def index
    # @messages = Message.order(id: :desc)
    @all_messages = Message.all

    # all_locations = Location.all
    @matching_locations = Location.where({address: current_user.message.location.address})

    # @nearby_messages = Message.all.each
    # render json: @matching_locations




  end

  # binding.pry
  def create
    # render json: params
    # unless params[:address] == nil
    message = Message.create({
      summary: params[:summary],
      content: params[:content],
      user_id: current_user.id
      })

    location = Location.create({
      latitude: Geocoder.coordinates(params[:address])[0],
      longitude: Geocoder.coordinates(params[:address])[1],
      address: (params[:address]),
      message_id: message.id
      })

      redirect_to locations_url
    # else
    #   redirect_to :new_message, :notice => "Please enter an address."
    # end
  end

  def edit
    @message = Message.find(params[:id])
    render partial: "messageform", locals: { message_local: @message }
  end

  def update
     message = Message.find(params[:address])
     message.update_attributes(message_attributes)
     redirect_to messages_url
  end

  def destroy
    message[:message_id] = nil
    redirect_to :new_message, :notice => "You left the flock."
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end



  # private

  # def message_attributes
  #   params.require(:message).permit(:address, :summary, :content)
  # end


end
