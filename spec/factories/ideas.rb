FactoryBot.define do

  factory :idea do
    body        { '仕事のtoリストを作る' }
    sequence(:category_id) { |n| "#{n}" }

    after(:build) do |idea|
      idea.category = FactoryBot.build(:category)
    end
  end

  factory :category do
    name     { '仕事'}
  end

end