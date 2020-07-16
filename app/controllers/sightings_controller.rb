class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting, except: [:created_at, :updated_at]
      end
end
