require_relative 'parser'
require_relative 'rating'

parsed_page = ParseService.new('https://rb7.ru/afisha/movies')
rating = RatingService.new(parsed_page.get_movies)

puts rating.sort_by_movie_sessions