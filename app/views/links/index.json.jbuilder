json.array!(@links) do |link|
  json.extract! link, :id, :url, :title
  json.url link_url(link, format: :json)
end
