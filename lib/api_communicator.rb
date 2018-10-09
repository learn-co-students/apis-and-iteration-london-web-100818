require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each { |details|
    if details["name"].downcase == character
      film_list = details["films"].map { |films_api|
        response_hash = JSON.parse(RestClient.get(films_api))
        response_hash["title"]
      }
    end
    return film_list
  }
end


def print_movies(films_array)
  films_array.each_with_index do |film_title, index|
      puts "#{index + 1 }. #{film_title}"
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
