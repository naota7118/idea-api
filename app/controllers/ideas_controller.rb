class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  def index
    binding.pry
    @ideas = Idea.order(id: :asc)

    @data = []
    @data << @ideas.map do |idea|
      { "id" => idea[:id], "category" => Category.find_by(id: idea[:category_id]).name, "body" => idea[:body] }
    end

    render json: @data
    binding.pry
  end

  def show
    render json: @idea
  end
  
  def create

    @category = Category.new(category_params)
    @idea = Idea.new(idea_params)

    # 新規category_nameがすでにcategoriesテーブルに存在する場合
    if Category.exists?(name: category_params[:name])
      @categoryId = Category.find_by(name: category_params[:name]).id
      @idea.category_id = @categoryId

      if @idea.save
        # idea_nameの登録が成功したらステータスコード201を返す
        head :created
      else
        # idea_nameの登録が失敗したらステータスコード422を返す（バリデーションエラー時）
        head :unprocessable_entity
      end
    
    # 新規category_nameがまだcategoriesテーブルに存在していない場合
    else
      # categoriesテーブルをidの小さい順に並べて最後のidを取得し、それに+1したidを新規category_nameに付与。
      # 配列の形で格納されているのでlastメソッドで最後の値を取得
      @lastCategoryId = Category.order('name DESC').limit(1).ids.last
      @idea.category_id = @lastCategoryId + 1

      if @idea.save && @category.save
        # idea_nameの登録が成功したらステータスコード201を返す
        head :created
      else
        # idea_nameの登録が失敗したらステータスコード422を返す（バリデーションエラー時）
        head :unprocessable_entity
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
    params.require(:idea).permit(:body)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end