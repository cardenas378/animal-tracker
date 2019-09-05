class AnimalsController < ApplicationController
    def index 
        @animals = Animal.all
        render json: @animals
    end 
    
    def show 
        @animal = Animal.find(params[:id])
        render json: @animal 
    end 
    
    def create 
        @animal = Animal.new(animal_params)
        if @animal.save
            render json: @animal, status: 201
        else 
            render json: @animal.errors, status: 422 
        end 
    end
    
    def destroy
        @animal = Animal.find(params[:id])
        if @animal.destroy
            render json:@animal, status: 200
        else
            render json:{errors: 'Could not destroy'}
        end
    end 
    
            
    def update 
        @animal = Animal.find(params[:id])
        if @animal.update(animal_params)
            render json:@animal
        else
            render json: {errors: 'Could not update'}
        end
    end
    
    
    
    private 
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end 
end 
         
