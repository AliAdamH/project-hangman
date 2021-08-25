module Hangman
  # Generates a word.
  class Words
    attr_reader :word, :word_map
    attr_accessor :hidden

    def initialize
      @word = random_word
      @hidden = hide
      @word_map = mapping
    end

    def random_word
      line = rand(52_452)
      IO.readlines('better_dict.txt', chomp: true)[line].downcase
    end

    def hide
      @word.gsub(/[a-z]/, '_').split('')
    end

    def mapping
      @word.split('').each_with_index.reduce({}) do |acc, (letter, index)|
        if acc[letter].is_a?(Array)
          acc[letter] << index
        elsif acc.key?(letter)
          acc[letter] = [acc[letter]] << index
        else
          acc[letter] = index
        end
        acc
      end
    end
  end
end
