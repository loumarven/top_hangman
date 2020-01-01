=begin
TODO:
1. Improve UI (add stickman)
2. Add save game feature
3. Do input checking
4. Refactor/cleanup
=end

require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'common.rb'

class Hangman
  include Common

  attr_reader :player_name, :winner

  def initialize(player_name)
    @player = Player.new(player_name, ATTEMPTS)
    @computer = Computer.new
    @board = Board.new
    @player_name = player_name
    @winner = nil
  end

  def play
    @computer.gen_secret_word
    @board.word_length = @computer.secret_word.length

    until game_over? do
      @board.display
      letter = @player.get_guess_letter

      if @computer.letter_exists?(letter)
        @computer.update_correct(letter)
        @board.correct = @computer.correct_guesses
      else
        @player.attempts -= 1
        @computer.update_incorrect(letter)
        @board.incorrect = @computer.incorrect_guesses
      end
    end

    puts "Secret word: #{@computer.secret_word}"
  end

  private
  def game_over?
    if @player.dead?
      @winner = COMPUTER
      true
    elsif @computer.secret_word == @board.correct.join
      @winner = player_name
      true
    else
      false
    end
  end
end
