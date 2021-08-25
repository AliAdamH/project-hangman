require './words'
require './core_exstensions'
module Hangman
  # Displays the game.
  class Game
    def initialize
      @word = Words.new
      @word_with_letters = @word.word
      @hidden_word = @word.hidden
      @word_map = @word.mapping
      @attempts = 10
      @found_letters = []
    end

    def win?
      return true unless @hidden_word.include?('_')

      false
    end

    def get_letter(player_letter = gets.chomp)
      letter_to_index(player_letter)
    end

    def letter_to_index(player_letter)
      if @found_letters.include?(player_letter)
        puts "You've already guessed #{player_letter}"
      elsif @word_map.key?(player_letter)
        success(player_letter)
        @word_map[player_letter]
      else
        failure(player_letter)
      end
    end

    def update_word(index)
      if index.is_a?(Array)
        index.each do |i|
          @hidden_word[i] = @word_with_letters[i]
        end
      elsif index.is_a?(Numeric)
        @hidden_word[index] = @word_with_letters[index]
      end
    end

    def success(letter)
      puts "\nYou've found the letter #{letter}".green
      @found_letters << letter.green
      puts ''
    end

    def failure(letter)
      puts "#{letter} is a wrong guess !".red
      @found_letters << letter.red
      @attempts -= 1
      puts ''
    end

    def formatted_display
      puts "You have up to #{@attempts} wrong attempts "
      puts "Letters you've already guessed : #{@found_letters.join(' ')}" unless @found_letters.empty?
      puts @hidden_word.join(' ')
      2.times { puts '' }
    end

    def game_over?
      if win?
        puts "You've found the word : #{@word_with_letters}"
        true
      elsif @attempts.zero?
        puts "You've lost the game"
        puts "The word to guess was : #{@word_with_letters}"
        true
      end
    end

    def play
      puts 'Welcome to Hangman!'
      puts 'You have to guess the following word: '
      loop do
        formatted_display
        guess = get_letter
        # TODO : Get user choice of saving the game state.
        update_word(guess)
        break if game_over?

        next
      end
    end
  end
end

g = Hangman::Game.new
g.play
