require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

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


def print_movies(films_array)
    films_array.each do |film|
      puts film["title"]
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
