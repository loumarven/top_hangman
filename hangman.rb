require './player'
require './computer'
require './board'
require './common'

class Hangman
  attr_reader :player_name, :winner

  def initialize(player_name)
    @player = Player.new(player_name)
    @computer = Computer.new
    @board = Board.new
    @player_name = player_name
    @winner = nil
  end

  def play
    @computer.gen_secret_word

    until game_over? do
      @board.display
      letter = @player.get_guess_letter

      if @computer.letter_exists?(letter)
        @computer.update_correct(letter)
        @board.correct = @computer.correct_guesses
      else
        @computer.update_incorrect(letter)
        @board.incorrect = @computer.incorrect_guesses
        @board.update_stickman
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
