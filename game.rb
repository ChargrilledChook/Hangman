# frozen_string_literal: true

# general file until i make class decisions
class Game
  attr_reader :dict
  attr_accessor :guesses, :guess_display, :progress, :wrong_guesses, :player, :secret_word

  def initialize
    @dict = DictLoader.new
    @player = Player.new
    @secret_word = dict.secret_word
    @guesses = 0
    @guess_display = ['.'] * 6
    @progress = secret_word.split('').map { '_' }
    @wrong_guesses = []
  end

  def round
    %(
      #{progress.join(' ')}   ||   #{guesses} incorrect guesses.   ||   Incorrect guesses: #{wrong_guesses.join(' ')}
    )
  end

  def game_loop
    game_won = false
    until guesses == 6
      guess = check_input
      if match?(guess)
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

  def check_input
    guess = 'foo'
    until guess.length == 1
      print player_prompt
      guess = player.get_input
    end
    guess
  end

  def intro
    puts welcome_string
    puts menu_text
    puts rules_text
    puts game_intro
    puts secret_word
    puts round
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

  def win_message
    %(
    You guessed correctly! The word was #{secret_word}. Well done!
  )
  end

  def loss_message
    %(
    You didn't guess in time! The word was #{secret_word}. Bad luck!
    )
  end
end
