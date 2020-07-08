# frozen_string_literal: true

# Responsible for getting user input
module Player
  def get_input
    gets.chomp.downcase
  end
end
