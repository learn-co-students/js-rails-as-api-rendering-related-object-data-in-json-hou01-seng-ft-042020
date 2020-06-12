class SightingsController < ApplicationController

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    # end
       
        # render json: sighting
        # {
        #     id: 1,
        #     bird_id: 1,
        #     location_id: 2,
        #     created_at: "2020-06-12T14:42:08.697Z",
        #     updated_at: "2020-06-12T14:42:08.697Z"
        #     }

        
        # render json: {id: sighting.id, bird: sighting.bird, locations: sighting.location}
            # {
            # id: 1,
            # bird: {
            # id: 1,
            # name: "Black-Capped Chickadee",
            # species: "Poecile Atricapillus",
            # created_at: "2020-06-12T14:42:08.574Z",
            # updated_at: "2020-06-12T14:42:08.574Z"
            # },
            # locations: {
            # id: 2,
            # latitude: "30.26715",
            # float: null,
            # longitude: -97.74306,
            # created_at: "2020-06-12T14:42:08.611Z",
            # updated_at: "2020-06-12T14:42:08.611Z"
            # }
            # }
    

            # render json: sighting, include: [:bird, :location]
            # {
            #     id: 1,
            #     bird_id: 1,
            #     location_id: 2,
            #     created_at: "2020-06-12T14:42:08.697Z",
            #     updated_at: "2020-06-12T14:42:08.697Z",
            #     bird: {
            #     id: 1,
            #     name: "Black-Capped Chickadee",
            #     species: "Poecile Atricapillus",
            #     created_at: "2020-06-12T14:42:08.574Z",
            #     updated_at: "2020-06-12T14:42:08.574Z"
            #     },
            #     location: {
            #     id: 2,
            #     latitude: "30.26715",
            #     float: null,
            #     longitude: -97.74306,
            #     created_at: "2020-06-12T14:42:08.611Z",
            #     updated_at: "2020-06-12T14:42:08.611Z"
            #     }
            #     }
    



        # def index
        #     sightings = Sighting.all 
        #     render json: sightings, include: [:bird, :location]
        # end
    
    
     def index
        sightings = Sighting.all 
        render json: sightings.to_json(include: [:bird, :locatuon])
    end
    
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     if sighting 
    #         render json: sighting.to_json(include: [:bird, :location])
    #     else
    #         render json: {message: "No sighting found with that id"}
    #     end
    # end

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
      end

end
