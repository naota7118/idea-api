require 'rails_helper'

describe IdeasController do
  describe 'GET #create' do
    it "@ideaに正しい値が入っていること" do
      idea = create(:idea)
      get :create, params: { id: idea }
      expect(assigns(:idea)).to eq idea
    end
  end

  describe 'GET #index' do
    it "@ideaに正しい値が入っていること" do
      ideas = create_list(:idea, 3)
      get :index
      expect(assigns(:ideas)).to match(ideas.sort { |a, b| a.id <=> b.id } )
      expect(assigns(:tweets)).to match(tweets.sort { |a, b| b.created_at <=> a.created_at } )
    end
  end

end