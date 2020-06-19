require_relative 'dic_loader'
require_relative 'game'

dict = DictLoader.new
puts dict.secret_word
game = Game.new
game.intro

pp game.guess_display