# frozen_string_literal: true

# Responsible for getting user input
module Player
  def get_input
    input = gets.chomp.downcase
    input
  end
end
