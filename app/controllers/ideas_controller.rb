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
    # @category = Category.new(category_params)
    if @idea.save
      render :show, status: :created, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end

    # すでにそのcategory_nameがcategoriesテーブルのnameカラムに存在する場合
    if Category.exists?(name: category_params[:name])
      # 登録しようとしてるcategory名と一致するcategory名をcategoriesテーブルから検索して探す
      # 見つけたcategory名のidを取得してideasテーブルに登録する
      @category_id = Category.find_by(name: category_params[:name]).select('id')
      
    # まだそのcategory_nameがcategoriesテーブルのnameカラムに存在してない場合
    else 
      # 新たなcategoryとしてcategoriesテーブルに登録し、ideasテーブルに登録する
      @idea = Idea.new(idea_params)
      @category = Category.new(category_params)
      if @idea.save
        render :show, status: :created, location: @idea
      else
        render json: @idea.errors, status: :unprocessable_entity
      end
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

    def category_params
      params.require(:category).permit(:name)
    end

end
