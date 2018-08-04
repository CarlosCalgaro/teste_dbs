class VotesController < ApplicationController


    def create  
        @vote = Vote.new(restaurant_params)

        respond_to do |format|
          if @restaurant.save
            format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
            format.json { render :show, status: :created, location: @restaurant }
          else
            format.html { render :new }
            format.json { render json: @restaurant.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    
    def vote_params
        params.require(:vote).permit(:restaurant_id)
    end
end