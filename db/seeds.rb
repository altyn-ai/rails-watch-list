# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Bookmark.destroy_all
List.destroy_all

require 'json'
require 'open-uri'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=58ce1a1a655fee13298796c100e29aec'
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)['results']


10.times do |i|
  movie = Movie.new(
    title:  movies[i]['original_title'],
    overview:  movies[i]['overview'],
    poster_url:  "https://image.tmdb.org/t/p/w500/#{movies[i]['poster_path']}",
    rating: movies[i]['vote_average']
    )
  movie.save!
end
puts 'Finished creating movies!'

classic = List.create!(name: 'Classic', poster_url: "https://images.unsplash.com/photo-1590452522688-e919e18c9e96?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGNpbmVtYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
action = List.create!(name: 'Action', poster_url: "https://images.unsplash.com/photo-1517128076055-be58e94ba823?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZpZ2h0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
superhero = List.create!(name: 'Superhero', poster_url: "https://images.unsplash.com/photo-1611604548018-d56bbd85d681?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHN1cGVyaGVyb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
drama = List.create!(name: 'Drama', poster_url: "https://images.unsplash.com/photo-1597176116047-876a32798fcc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")

puts 'Finished creating lists!'

id = Movie.ids.min

bookmarks = ['Recommended by Kani', 'Oscar nominees', 'Finns favourite', 'All time classics']
lists = [classic, action, superhero, drama]
movie_id = Movie.ids.min

10.times do |i|
  bookmark = Bookmark.new(
    comment: bookmarks.sample,
    movie_id: movie_id + i,
    list_id: lists.sample.id
    )
  bookmark.save!
end

# Bookmark.create(comment: 'Recommended by Aida',
#                 movie_id: ,
#                 list_id: classic.id)

# Bookmark.create(comment: 'Recommended by Aida',
#                 movie_id: 2,
#                 list_id: action.id)

# Bookmark.create(comment: 'Recommended by Aida',
#                 movie_id: 3,
#                 list_id: superhero.id)

# Bookmark.create(comment: 'Recommended by Aida',
#                 movie_id: 4,
#                 list_id: drama.id)

puts 'Finished creating bookmarks!'


