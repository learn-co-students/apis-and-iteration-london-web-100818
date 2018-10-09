require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films_hash = {}
  response_hash["results"].each do |data|
    if data["name"].downcase == character.downcase
      films_hash = data["films"].map do |film|
        JSON.parse(RestClient.get(film))
      end
    end
  end
  return films_hash
end

# get_character_movies_from_api("Luke Skywalker")

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def print_movies(films_array)
    films_array.each do |film|
      puts film["title"]
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
