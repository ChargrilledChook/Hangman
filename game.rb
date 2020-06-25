# frozen_string_literal: true

require_relative 'text_content'
require 'yaml'

# general file until i make class decisions
class Game
  include TextContent

  attr_reader :dict
  attr_accessor :guesses, :progress, :wrong_guesses, :player, :secret_word

  def initialize
    @player = Player.new
    @secret_word = secret_word_get(DictLoader.new)
    @guesses = 0
    @progress = secret_word.split('').map { '_' }
    @wrong_guesses = []
  end

  def secret_word_get(dict)
    dict.secret_word
  end

  def intro
    puts welcome_string
    puts menu_text
    puts rules_text
    puts game_intro
    puts secret_word
    puts round
    game_loop
  end

  def save
    yaml = YAML.dump(self)
    file = File.new('save.txt', 'w+')
    file.puts(yaml)
    file.close
    puts save_message
    exit
  end

  private

  def round
    %(
      #{progress.join(' ')}   ||   #{guesses} incorrect guesses.   ||   Incorrect guesses: #{wrong_guesses.join(' ')}
    )
  end

  def game_loop
    game_won = false
    until guesses == 6
      guess = check_input_length
      if guess == '1'
        save_manager(guess)
      elsif match?(guess)
        self.progress = compare(guess, secret_word, progress)
      else
        wrong_guesses << guess
        self.guesses += 1
      end
      if secret_word == progress.join('')
        puts win_message
        game_won = true
        break
      else
        puts round
      end
    end
    puts loss_message unless game_won == true
  end

  def match?(guess)
    secret_word.include?(guess)
  end

  def compare(letter, secret_word, player_word)
    secret_word.split('').each_with_index do |char, idx|
      player_word[idx] = letter if letter == char
    end
    player_word
  end

  def save_manager(option)
    save if option.to_i == 1
  end

  def check_input_length
    guess = 'foo'
    until guess.length == 1 && letter?(guess)
      print player_prompt
      guess = player.get_input
    end
    guess
  end

  def letter?(guess)
    guess =~ /[[:alpha:]]/
  end
end
