require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
  
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
    response_hash['results'].each do |character_data|
      return character_data['name'].downcase == character ? character_data['films'] : nil
    end
end

# get_character_movies_from_api('R2-D2')

def print_movies(films_hash)
  films_hash.each do |each_array|
    response_string = RestClient.get(each_array)
    response_hash = JSON.parse(response_string)
    puts response_hash['title']
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
