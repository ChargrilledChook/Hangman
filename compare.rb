def compare(letter, secret_word, player_word)
  secret_word.split('').each_with_index do |char, idx|
    if letter == char
      player_word[idx] = letter
    end
  end
  player_word
end

secret = 'hello'
player1 = secret.split('').map { '_' }
guess = 'h'

player1 = compare(guess, secret, player1)

guess = 'l'
puts compare(guess, secret, player1).join(' ')

def guess_right?(char)
end
