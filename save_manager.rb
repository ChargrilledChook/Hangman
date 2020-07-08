# frozen_string_literal: true

# Saves and loads games / serializes objects
module SaveManager
  def default_save
    'save.txt'
  end

  def save_game(game)
    yaml = YAML.dump(game)
    file = File.new(default_save, 'w+')
    file.puts(yaml)
    file.close
    puts save_message
    exit
  end

  def load_save
    YAML.load(File.read(default_save))
  end
end
