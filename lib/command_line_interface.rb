def welcome
  puts "Welcome to the CLI!"
end

def get_character_from_user
  puts "please enter a character"
  gets.chomp.downcase
  # user gets to capture the user's input. This method should return that input, downcased.
end

def user_choice_character
  user_input = get_character_from_user
  show_character_movies(user_input)
end
