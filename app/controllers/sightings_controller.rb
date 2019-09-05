class SightingsController < ApplicationController
        def index 
        @sightings = Sighting.all
        render json: @sightings
    end 
    
    def show 
        @sighting = Sighting.find(params[:id])
        render json: @sighting 
    end 
    
    def create 
        @sighting = Sighting.new(sighting_params)
        if @sighting.save
            render json: @sighting, status: 201
        else 
            render json: @sighting.errors, status: 422 
        end 
    end
    
    def destroy
        @sighting = Sighting.find(params[:id])
        if @sighting.destroy
            render json:@sighting, status: 200
        else
            render json:{errors: 'Could not destroy'}
        end
    end 
    
            
    def update 
        @sighting = Sighting.find(params[:id])
        if @sighting.update(sighting_params)
            render json:@sighting
        else
            render json: {errors: 'Could not update'}
        end
    end
    
    
    
    private 
    
    def sighting_params
        params.require(:sighting).permit(:animal, :date, :latitude, :longitude)
    end 
end 
     
end
