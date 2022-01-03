require './core_extensions.rb'
require './words.rb'
require './game.rb'
require 'yaml'

loop do 

  puts <<~INTRO
    Welcome to the Hangman Game !
    To play a new game enter: 1
    To load the last saved game enter: 2
  INTRO
  starting_choice = gets.chomp
  if (starting_choice == "1")
    Hangman::Game.new.play
  elsif (starting_choice == "2")
    Hangman::Game.load_game.play
  else
    puts 'You\'ve entered an invalid input'.red
    next
  end

  puts "Would you like to play another game ? ".yellow
  puts "To play a another game enter: 1"
  puts "To quit the game enter: 2"
  restart_choice = gets.chomp.to_i
  if (restart_choice == 1)
    next
  elsif(restart_choice == 2)
    break
  else
    puts 'You\'ve entered an invalid input'.red
  end
end


