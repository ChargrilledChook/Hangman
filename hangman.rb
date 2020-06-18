# general file until i make class decisions

puts welcome_string = %(
  Welcome to Hangman!)

puts menu_text = %(
  Enter your selection:

  1. New game
  2. Load game
  3. Rules)

puts rules_text = %(
  Guess the hidden word one letter at a time. But be careful - 6 incorrect
  guesses and you lose. Your correct guesses will be shown on the right and
  your incorrect guesses on the left.

  You can also attempt to guess the whole word at any time.

  Enter 1 while playing to restart.
  Enter 2 while playing to save and quit.

  Good luck!
)

print player_prompt = %(
  Enter your guess: )

