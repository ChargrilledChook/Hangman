# frozen_string_literal: true

require_relative 'dic_loader'
require_relative 'game'
require_relative 'player'

puts 'Enter your selection 1 new game 2 load'

def get_input
  input = gets.chomp.downcase
  input
end

def load_save
  game = YAML.load(File.read('save.txt'))
  game
end

def game_start(choice)
  if choice == '1'
    game = Game.new
    game.intro
  elsif choice == '2'
    game = load_save
    game.intro
  end
end

choice = get_input

game_start(choice)
