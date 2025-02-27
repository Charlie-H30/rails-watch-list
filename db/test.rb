require "json"
require "rest-client"

response = RestClient.get "https://api.mapbox.com/search/searchbox/v1/list/category?access_token=pk.eyJ1IjoiY2hhcmxpZWgzMCIsImEiOiJjbTcxenBubHQwNGV4MmtzN3BoYmVyd293In0._EAIkZM6g_gM2qPACFLg6A"
repos = JSON.parse(response)

repos["listItems"].each do |repo|
  puts repo["name"]
end
