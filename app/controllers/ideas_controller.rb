module Api
  module V1
    class IdeasController < ApplicationController
      before_action :set_idea, only: [:show, :update, :destroy]
    
      def index
        @ideas = Idea.order(created_at: :desc)
        render json: @ideas
      end
    
      def show
        render json: @idea
      end
    
      def create
        @idea = Idea.new(idea_params)
    
        if @idea.save
          render :show, status: :created, location: @idea
        else
          render json: @idea.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @idea.update(idea_params)
          render :show, status: :ok, location: @idea
        else
          render json: @idea.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @idea.destroy
      end
    
      private
        def set_idea
          @idea = Idea.find(params[:id])
        end
    
        def idea_params
          params.require(:idea).permit(:body, :category_id)
        end
    end
  end
end
