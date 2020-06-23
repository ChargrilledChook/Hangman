# frozen_string_literal: true

def compare(letter, secret_word, guesses)
  guesses << letter if secret_word.include?(letter)
end

def draw_word(secret_word, guesses)
  secret_word.split('').each do |e|
    if e.include?(guesses.join(''))
      print e
    else
      print '_'
    end
  end
  puts
end

letter = 'h'
secret = 'hello'
guesses = []

compare(letter, secret, guesses)
draw_word(secret, guesses)

puts guesses

compare('l', secret, guesses)
draw_word(secret, guesses)

puts guesses
