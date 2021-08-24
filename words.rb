module Hangman
  # Generates a word.
  class Words
    attr_reader :word

    def initialize
      @word = random_word
    end

    def random_word
      line = rand(52_452)
      IO.readlines('better_dict.txt', chomp: true)[line]
    end
  end
end