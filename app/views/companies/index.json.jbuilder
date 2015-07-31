json.array!(@companies) do |company|
  json.extract! company, :id, :index, :show
  json.url company_url(company, format: :json)
end
