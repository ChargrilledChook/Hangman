# Hangman
A project for the file I/O and serialisation section of The Odin Project in intermediate ruby programming.


# Pseudocode 

* Load a dictionary 
* Select a random word between 5 and 12 letters
* Close dictionary

* Write welcome message plus instructions to console
* Menu prompting user for new game or load game
* if load import serialised game and resume
* else
* Main game loop
  * draw a display that shows number of letters in the word
  * current incorrect guesses
  * how many 'lives' the player has left
  
  * Prompt user for input (w/instructions)
  * If 1, save and exit the game (using yaml or json)
  * Else
  * Prompt user for input until receive valid input (any single letter)
  * Convert letter to downcase
  * Compare guess to the secret word
  * If letter is correct, place on board in all correct positions
  * Else subtract a life and place letter in incorrect guess section
  * Go to main game loop and repeat until a win or loss condition is reached 
  * Win = the correct word is guessed
  * Loss = player guesses incorrectly too many times
