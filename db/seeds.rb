require "open-uri"
require "json"

puts "Limpiando base de datos"
Bookmark.destroy_all
Movie.destroy_all

response = URI.open("http://tmdb.lewagon.com/movie/top_rated")
data = JSON.parse(response.read)

data["results"].each do |movie|
  image_path = movie["poster_path"]
  new_movie = Movie.new(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w300#{image_path}",
    rating: rand(1..5)
  )
  new_movie.save!
  puts "Guardando película #{new_movie.title}\n"
end