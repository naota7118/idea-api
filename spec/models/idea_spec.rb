require 'rails_helper'

RSpec.describe Idea do

  it "is valid widh a body, category_id" do
    idea = Idea.new(
      body: "アイディアA",
      category_id: "1"
    )
    expect(idea).to be_valid
  end

  # 有効なファクトリを持つこと
  it "has v valid factory" do
    expect(FactoryBot.create(:idea)).to be_valid
  end

  # bodyがなければ無効な状態であること
  it "is invalid without body" do
    idea = FactoryBot.create(:idea, body: nil)
    idea.valid?
    expe
    ct(idea.errors[:body]).to include("can't be blank")
  end
  # category_idがなければ無効な状態であること
  it "is invalid without category_id" do
    idea = FactoryBot.create(:idea, category_id: nil)
    idea.valid?
    expect(idea.errors[:category_id]).to include("can't be blank")
  end

  before(:each) do
    @idea = create(:idea)
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