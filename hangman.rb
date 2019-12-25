require './player'
require './computer'
require './board'
require './common'

class Hangman
  attr_reader :winner

  def initialize
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
  end

  def play
    @computer.gen_secret_word

    until game_over?
      @board.display
      letter = @player.letter

      if @computer.letter_exists?(letter)
        @board.save_correct(letter)
      else
        @board.update_stickman
        @board.save_incorrect(letter)
      end
    end
  end

  private
  def game_over?
    @computer.secret_word == @player.guess
  end
end
