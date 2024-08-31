module Hangman
  # Displays the game.
  class Game
    def initialize
      @word = Words.new
      @word_with_letters = @word.word
      @hidden_word = @word.hidden
      @word_map = @word.mapping
      @attempts = 10
      @letters_found = []
      @colored_letters = []
    end

    def win?
      return true unless @hidden_word.include?('_')

      false
    end

    def get_letter(player_letter = gets.chomp.downcase)
      return :game_saved if save?(player_letter)
      return :invalid_input unless valid?(player_letter)

      letter_to_index(player_letter)
    end

    def letter_to_index(player_letter)
      if @letters_found.include?(player_letter)
        puts "\nYou've already guessed #{player_letter}\n".yellow
      elsif @word_map.key?(player_letter)
        success(player_letter)
        @word_map[player_letter]
      else
        failure(player_letter)
      end
    end

    def update_word(index)
      case index
      when Array
        index.each do |i|
          @hidden_word[i] = @word_with_letters[i]
        end
      when Numeric
        @hidden_word[index] = @word_with_letters[index]
      end
    end

    def success(letter)
      puts "\nYou've found the letter #{letter}".green
      @colored_letters << letter.green
      @letters_found << letter
      puts ''
    end

    def failure(letter)
      puts "\n#{letter} is a wrong guess !".red
      @colored_letters << letter.red
      @letters_found << letter
      @attempts -= 1
      puts ''
    end

    def formatted_display
      puts "You have up to #{@attempts} wrong attempts "
      puts "Letters you've already guessed : #{@colored_letters.join(' ')}" unless @colored_letters.empty?
      puts "Guess the word ! Input a letter or type 'save' to save the game\n\n"
      puts @hidden_word.join(' ')
      2.times { puts '' }
    end

    def game_over?
      if win?
        puts "You've found the word : #{@word_with_letters}\n\n".green
        true
      elsif @attempts.zero?
        puts "You've lost the game\n\n"
        puts "The word to guess was : #{@word_with_letters}\n\n".red
        true
      end
    end

    def save?(input)
      if input == 'save'
        save_game
        return true
      end
      false
    end

    def save_game
      File.open('save.yaml', 'w') { |f| f.puts YAML.dump(self) }
      puts 'Game Saved ! See ya !'
    end

    def self.load_game
      YAML.load_file('save.yaml', permitted_classes: [Hangman::Game, Hangman::Words], aliases: true)
    end

    def valid?(input)
      return true if input.match(/[a-z]/) && input.length == 1

      puts "\nInvalid input !\n\n"
      false
    end

    def play
      loop do
        puts "\e[H\e[2J"
        formatted_display
        guess = get_letter
        break if guess == :game_saved

        next if guess == :invalid_input

        update_word(guess)
        break if game_over?

        next
      end
    end
  end
end
