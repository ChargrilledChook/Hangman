# frozen_string_literal: true

require_relative 'text_content'
require_relative 'player'
require 'yaml'

# Responsible for type of game that is launched
class GameManager
  include TextContent
  include Player

  def intro
    puts welcome_string
    puts rules_text
    puts menu_text
    print empty_prompt
    choice = get_input
    game_start(choice)
  end

  def game_start(choice)
    if choice == '2'
      game = load_save
    else
      game = Game.new
    end
    game.begin_game
  end
 
  def save_game(game)
    yaml = YAML.dump(game)
    file = File.new('save.txt', 'w+')
    file.puts(yaml)
    file.close
    puts save_message
    exit
  end

  def load_save
    game = YAML.load(File.read('save.txt'))
    game
  end
end
