# frozen_string_literal: true

# Contains majority of the strings required for the game / user feedback
module TextContent
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

  def save_message
    %(
    Your game has been saved. See you next time!
    )
  end

  def new_game_message
    %(
    
    )
  end
end
