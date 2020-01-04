require './hangman'

game = Hangman.new("Lou")
game.start
puts "WINNER: #{game.winner}"

