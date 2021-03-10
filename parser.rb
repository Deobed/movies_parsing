require 'open-uri'
require 'nokogiri'

class ParseService
  def initialize(url)
    @url = url
    @movies = {}
  end

  # Получение списка фильмов из афиши
  def get_movies
    parse_page = Nokogiri::HTML(URI.open(@url))
    parse_page.css('.movie').each do |movie_area|
      movie_name = movie_area.css('h2').text.strip
      @movies[movie_name] = movie_area.css('.show').size
    end

    @movies
  end
end