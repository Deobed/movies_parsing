require 'json'

class RatingService
  def initialize(movies)
    @movies = movies
  end

  # Сортировка полученных фильмов по количеству сеансов
  def sort_by_movie_sessions
    @movies.sort_by(&:last)
           .reverse
           .first(3)
           .to_h
           .to_json
  end
end