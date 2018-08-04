class VotesController < ApplicationController

    def index
        @restaurant = Restaurant.first
    end

    def new
        @vote = Vote.new
        @restaurants = Restaurant.all
    end

    def create  
        @vote = Vote.new(vote_params)
        respond_to do |format|
          if !can_vote?(current_user)
            format.html { redirect_to votes_path, alert: 'Você ja votou hoje' }
          elsif @vote.save
            format.html { redirect_to votes_path, notice: 'Você votou' }
          else
            format.html { render :new }
          end
        end
    end

    private

    def vote_params
        params.require(:vote).permit(:restaurant_id)
    end

    def can_vote?(user)
        Vote.all.where(user_id: user.id, time: Time.now).count > 0 ? false : true
    end
end