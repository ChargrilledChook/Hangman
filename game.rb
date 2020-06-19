# frozen_string_literal: true

# general file until i make class decisions
class Game
  attr_reader :dict, :secret_word
  attr_accessor :guesses, :guess_display

  def initialize
    @dict = DictLoader.new
    @secret_word = dict.secret_word
    @guesses = 0
    @guess_display = ['.'] * 6
  end

  def intro
    puts welcome_string
    puts menu_text
    puts rules_text
    puts game_intro
    puts secret_word
    print player_prompt
  end

  def welcome_string
    %(
    Welcome to Hangman!)
  end

  def menu_text
    %(
    Enter your selection:

    1. New game
    2. Load game
    3. Rules)
  end

  def rules_text
    %(
    Guess the hidden word one letter at a time. But be careful - 6 incorrect
    guesses and you lose. Your correct guesses will be shown on the left and
    your incorrect guesses on the right.

    You can also attempt to guess the whole word at any time.

    Enter 1 while playing to restart.
    Enter 2 while playing to save and quit.

    Good luck!
  )
  end

  def game_intro
    %(
    The secret word is #{secret_word.length} letters long.
    )
  end

  def player_prompt
    %(
    Enter your guess: )
  end

  
end

