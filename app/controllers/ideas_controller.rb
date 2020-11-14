class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.order(created_at: :desc)
    render json: @ideas
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      render :show, status: :created, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    if @idea.update(idea_params)
      render :show, status: :ok, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:name)
    end
end
