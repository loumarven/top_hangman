require './player'
require './computer'
require './board'
require './common'

class Hangman
  attr_reader :player_name, :winner

  def initialize(player_name)
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
    @player_name = player_name
    @winner = nil
  end

  def play
    @board.word = @computer.gen_secret_word

    until game_over? do
      @board.display
      letter = @player.guess_letter

      if @computer.letter_exists?(letter)
        @computer.update_guess(letter)
        @board.save_correct(@computer.correct_guess)
      else
        @board.update_stickman
        @board.save_incorrect(letter)
      end
    end
  end

  private
  def game_over?
    if @computer.hangman_dead?
      @winner = COMPUTER
    elsif @computer.secret_word == @player.guess
      @winner = player_name
    end

    false
  end
end
