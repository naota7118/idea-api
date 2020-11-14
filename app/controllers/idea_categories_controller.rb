module Api
  module V1
    class IdeaCategoriesController < ApplicationController
      before_action :set_idea_category, only: [:show, :update, :destroy]
    
      def index
        @ideaCategories = IdeaCategory.all
        render json: @ideaCategories
      end
    
      def show
        render json: @ideaCategory
      end
    
      def create
        @ideaCategory = IdeaCategory.new(ideaCategory_params)
    
        if @ideaCategory.save
          render :show, status: :created, location: @ideaCategory
        else
          render json: @ideaCategory.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @ideaCategory.update(ideaCategory_params)
          render :show, status: :ok, location: @ideaCategory
        else
          render json: @ideaCategory.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @ideaCategory.destroy
      end
    
      private
        def set_category
          @ideaCategory = IdeaCategory.find(params[:id])
        end
    
        def category_params
          params.require(:ideaCategory).permit(:idea_id, :category_id)
        end
    end
  end
end
