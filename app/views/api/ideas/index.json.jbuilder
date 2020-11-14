json.set! :ideas do
  json.array! @ideas do |idea|
    json.extract! idea, :id, :name, :created_at, :updated_at
  end
end