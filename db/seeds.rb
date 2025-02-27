require "json"
require "rest-client"
require "faker"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning Data"
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "Data destroyed"

puts "Creating 10 movies from API"

response = RestClient.get "https://tmdb.lewagon.com/movie/top_rated"
repos = JSON.parse(response)

repos["results"].first(10).each do |movie|
  Movie.create!(title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"])
end

puts "Finished Movies! Created #{Movie.count} movies"

puts "Creating 3 lists"
List.create!(name: "Drama")
List.create!(name: "All time favourites")
List.create!(name: "Comfort")

puts "Finished Lists! Create #{List.count} lists"

# puts "Creating bookmarks"
# Bookmark.create!(comment: Faker::Quote.famous_last_words,
#                 movie_id: )

puts "All Finished"
