# frozen_string_literal: true

# Responsible for loading a dictionary and selecting a random word from it
class DictLoader
  attr_reader :dict
  attr_accessor :word

  def initialize
    @dict = load_dict
    @word = choose_word(dict).downcase
  end

  def load_dict
    dict = []
    f = File.open('dictionary.txt', 'r')
    while line = f.gets
      dict << line
    end
    f.close
    dict
  end

  def choose_word(dict)
    result = 'foo'
    result = dict.sample while result.length < 5 || result.length > 12
    result
  end
end

# dictloader = DictLoader.new
# puts dictloader.dict.sample
# puts dictloader.word
