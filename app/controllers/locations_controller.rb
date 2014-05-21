class LocationsController < ApplicationController

  def index

    @all_locations = Location.all
    # render json: @all_locations

    @same_address_locations = Location.where({address: current_user.location.address})
    # render json: @same_address_locations

    @nearby_as_selected_by_geocoder_locations =[]         #### TODO: This is expensive. Refactor someday.
        Location.all.each do |location|
          if location.distance_to(current_user) < 1
            @nearby_as_selected_by_geocoder_locations << location
          end
        end
  end

end
