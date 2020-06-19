require_relative 'dic_loader'
require_relative 'game'
require_relative 'player'

game = Game.new
game.intro
game.game_loop
puts game.round
game.game_loop
puts game.round