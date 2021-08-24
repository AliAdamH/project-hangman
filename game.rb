module Hangman
  # Displays the game.
  class Game
    
    def initialize
      @word = Word.new
      @word_with_letters = @word.word
      @hidden_word = @word.hidden
      @word_map = @word.mapping
    end

  end
end
