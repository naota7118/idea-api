require 'rails_helper'

describe 'IdeaAPI' do
  it '全てのポストを取得する' do
    FactoryBot.create_list(:idea, 10)

    get '/ideas'
    # parseメソッドは文字列形式のjsonを読み込む
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json['data'].length).to eq(10)
  end
end