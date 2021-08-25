require './core_extensions.rb'
require './words.rb'
require './game.rb'
require 'yaml'

loop do 

  puts "Welcome to the Hangman Game !"
  puts "To play a new game enter 1"
  puts "To load a game enter 2"
  starting_choice = gets.chomp
  if (starting_choice == "1")
    Hangman::Game.new.play
  elsif (starting_choice == "2")
    Hangman::Game.load_game.play
  else
    puts 'You\'ve entered an invalid input'.red
  end

  puts "Would you like to play a new game again? ".yellow
  restart_choice = gets.chomp.to_i
  if (restart_choice == 1)
    next
  elsif(restart_choice == 2)
    break
  else
    puts 'You\'ve entered an invalid input'.red
  end
end


