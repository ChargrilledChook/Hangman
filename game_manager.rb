# frozen_string_literal: true

require_relative 'text_content'
require_relative 'player'
require_relative 'save_manager'
require 'yaml'

# Responsible for initializing and introducting game
class GameManager
  include TextContent
  include Player
  include SaveManager

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
end
