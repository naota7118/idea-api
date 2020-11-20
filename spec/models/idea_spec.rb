require 'rails_helper'

RSpec.describe Idea, type: :model do

  before do
    @idea = build(:idea)
  end

  describe 'バリデーション' do
  
    it "bodyがない場合は登録できない" do
      @idea.body = ''
      expect(@idea.valid?).to eq(false)
    end

    it "category_idがない場合は登録できない" do
      @idea.category_id = ''
      expect(@idea.valid?).to eq(false)
    end
  
  end
end