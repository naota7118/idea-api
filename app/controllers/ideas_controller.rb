class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  def index
    @ideas = Idea.order(created_at: :desc)
    render json: { id: @ideas.ids, name: @ideas.select("body") }
  end

  def show
    render json: @idea
  end
  
  def create

  binding.pry
    @category = Category.new(category_params)
    @idea = Idea.new(idea_params)

    # if Category.exists?(name: @category.name)
    #   @categoryId = Category.find_by(name: @category.name).select('id')
    #   @idea.category_id = @categoryId

    if @idea.save && @category.save
      # ステータスコード201を返す
      head :created
    else
      # ステータスコード422を返す（バリデーションエラー時）
      head :unprocessable_entity
    end
  binding.pry
    # # すでにそのcategory_nameがcategoriesテーブルのnameカラムに存在する場合
    # if Category.exists?(name: category_params[:name])

    #   # 登録しようとしてるcategory名と一致するcategory名をcategoriesテーブルから検索して探す
    #   @categoryId = Category.find_by(name: category_params[:name]).select('id')

    #   @idea = Idea.new(idea_params)

    #   if @idea.save && @categoryId.save
    #     # ステータスコード201を返す
    #     head :created
    #   else
    #     # ステータスコード422を返す（バリデーションエラー時）
    #     head :unprocessable_entity
    #   end

    # # まだそのcategory_nameがcategoriesテーブルのnameカラムに存在してない場合
    # else 

    #   # 新たなcategoryとしてcategoriesテーブルに登録し、ideasテーブルに登録する
    #   @category = Category.new(category_params)
    #   @idea = Idea.new(idea_params)

    #   if @category.save && @idea.save
    #     # ステータスコード201を返す
    #     head :created
    #   else
    #     # ステータスコード422を返す（バリデーションエラー時）
    #     head :unprocessable_entity
    #   end

    # end

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
    params.require(:idea).permit(:body)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end