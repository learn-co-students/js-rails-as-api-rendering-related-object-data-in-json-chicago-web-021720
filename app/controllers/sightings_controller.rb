class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location], except: [:created_at])
    end

    def show
        sighting = Sighting.find(params[:id])
        if sighting
            render json: sighting.slice(:id, :bird, :location)
        else
            render json: { message: "Sore, nao reve the birde!"}
        end
    end

end
