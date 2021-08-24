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
        return
      elsif @word_map.key?(player_letter)
        success(player_letter)
        return @word_map[player_letter]
      else
        failure(player_letter)
        return
      end
    end

    def update_word(index)
      w = @hidden_word.split
      if index.is_a?(Array)
        index.each do |i|
          w[i] = @word_with_letters[i]
          @hidden_word = w.join(' ')
        end
      elsif index.is_a?(Numeric)
        w[index] = @word_with_letters[index]
        @hidden_word = w.join(' ')
      else
        return
      end
    end

    def success(letter)
      puts "You've found the letter #{letter}".green
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
      puts @hidden_word
      2.times { puts '' }
    end

    def play
      puts 'Welcome to Hangman!'
      puts 'You have to guess the following word: '
      while true
        formatted_display
        guess = get_letter
        # TODO : Get user choice of saving the game state.
        update_word(guess)
        if win?
          puts "You've found the word : #{@word_with_letters}"
          break
        elsif @attempts.zero?
          puts "You've lost the game"
          puts "The word to guess was : #{@word_with_letters}"
          break
        else
          next
        end
      end
    end
  end
end

g = Hangman::Game.new
g.play
