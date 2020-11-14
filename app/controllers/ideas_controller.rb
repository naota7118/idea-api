module Api
  module V1
    class IdeasController < ApplicationController
      before_action :set_idea, only: [:show, :update, :destroy]

      def index
        @ideas = Idea.order('created_at DESC')
      end
    
      def show
        render json: @ideas
      end
    
      def create
        @idea = Idea.new(idea_params)
        if @idea.save
          render json: @idea, status: :created
        else
          render json: @idea.errors, status: :unprocessable_entity
        end
      end

      def update
        if @idea.update(idea_params)
          render json: { status: 'SUCCESS', message: 'Updaed the idea', data: @idea }
          # render json: @idea
        else
          render json: { status: 'ERROR', message: 'Not updated', data: @idea.errors }
          # render json: @idea.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Idea.find(params[:id])destroy!
        # render json: { status: 'SUCCESS', message: 'Deleted the idea', data: @idea }
      end
    
      private
        def set_idea
          @idea = Idea.find(params[:id])
        end
    
        def idea_params
          params.require(:idea).permit(:name)
        end
    end
  end
end