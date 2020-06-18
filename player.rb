# frozen_string_literal: true

# Responsible for getting user input
class Player

  def initialize(name = 'Player')
    @name = name
  end

  def get_input
    input = gets.chomp
    input
  end

end
