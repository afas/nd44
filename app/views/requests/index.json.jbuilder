json.array!(@requests) do |request|
  json.extract! request, :id, :author, :email, :address, :rtype, :body, :rstatus
  json.url request_url(request, format: :json)
end
