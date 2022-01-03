require './core_extensions'
require './words'
require './game'
require 'yaml'

loop do
  puts <<~INTRO
    Welcome to the Hangman Game !
    To play a new game enter: 1
    To load the last saved game enter: 2
  INTRO
  starting_choice = gets.chomp
  case starting_choice
  when '1' then Hangman::Game.new.play
  when '2' then Hangman::Game.load_game.play
  else
    puts 'You\'ve entered an invalid input'.red
    next
  end

  puts <<~OUTRO
    #{'Would you like to play another game ?'.yellow}
    To play a another game enter: 1
    To quit the game enter any other key
  OUTRO
  restart_choice = gets.chomp
  restart_choice == '1' ? next : break
end
