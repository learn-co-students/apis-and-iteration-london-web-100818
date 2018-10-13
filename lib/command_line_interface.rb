require 'rest-client'
require 'json'
require 'pry'

def welcome
  puts "Welcome, Star Wars fan!"
end

def get_character_from_user
  puts "Please enter a character's name:"
  character = gets.chomp.downcase
end
