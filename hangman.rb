=begin
TODO:
1. Improve UI (add stickman) OK
2. Add save game feature
3. Do input checking OK
4. Refactor/cleanup
=end

require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'helper.rb'

class Hangman
  include Helper

  attr_reader :player_name, :winner

  def initialize(player_name)
    @player = Player.new(player_name, ATTEMPTS)
    @computer = Computer.new
    @board = Board.new
    @player_name = player_name
    @winner = nil
  end

  def start
=begin
1. Check if json file exists. If yes, load the previous game state.
2. Display board. Show options.
=end
    @board.display
    show_options
    input = get_selected
     
    case input
    when PLAY
      play
=begin
#TODO
    when SAVE_QUIT
      save_quit 
    when QUIT
      quit
    when CONTINUE
      continue
=end
    else
      puts "Sorry, that is not yet available right now."
    end

  end

  private
  def play
    @computer.gen_secret_word
    @board.word_length = @computer.secret_word.length

    until game_over? do
      @board.display
      show_options

      letter = @player.get_guess_letter

      if @computer.letter_exists?(letter)
        @computer.update_correct(letter)
        @board.correct = @computer.correct_guesses
      else
        @computer.update_incorrect(letter)
        @board.incorrect = @computer.incorrect_guesses
        @player.attempts -= 1
      end
    end

    @board.display
    puts "Secret word: #{@computer.secret_word}"
  end

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
