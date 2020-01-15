=begin
TODO:
1. Improve UI (add stickman) OK
2. Add save game feature OK
3. Do input checking OK
4. Refactor/cleanup (move other methods to helper) OK
=end

require_relative 'game_data.rb'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'helper.rb'

class Hangman
  include Helper

  attr_reader :player_name, :winner

  def initialize(player_name)
    @player_name = player_name
    @player = nil
    @computer = nil
    @board = nil
    @winner = nil
    @prev_game = nil
    @game_state = NOT_PLAYING
  end

  def start
    @board.display
    show_options(@game_state)
    input = get_input(@game_state)
    do_action(input.to_i)
  end

  private
  def do_action(input)
    case input
    when NEW_GAME
      new_game
    when SAVE_QUIT
      save_quit 
    when QUIT
      quit
    when RESTORE
      @prev_game = restore
      continue
    else
      puts "Sorry, that is not yet available right now."
    end
  end

  def new_game
    @player = Player.new(@player_name, ATTEMPTS)
    @computer = Computer.new
    @board = Board.new

    delete_saved_game

    @computer.gen_secret_word
    @board.word_length = @computer.secret_word.length

    play
  end

  def play
    @game_state = PLAYING

    loop do
      @board.display
      show_options(@game_state)
      input = get_input(@game_state)

      if input.match(/[a-z]/)
        letter = input

        if @computer.letter_exists?(letter)
          @computer.update_correct(letter)
          @board.correct = @computer.correct_guesses
        else
          @computer.update_incorrect(letter)
          @board.incorrect = @computer.incorrect_guesses
          @player.attempts -= 1
        end

        break if game_over?
      elsif input.match(/[0-3]/)
        do_action(input.to_i)
      end
    end

    @board.display
    puts "Secret word: #{@computer.secret_word}"
  end

  def save_quit
    save_game(GameData.new(@player, @computer, @board, @winner))
    puts "Game saved!"

    quit
  end

  def quit
    puts "Quitting game..."
    exit
  end

  def restore
    load_saved_game
  end

  def continue
    @player = @prev_game.player
    @computer = @prev_game.computer
    @board = @prev_game.board
    @winner = @prev_game.winner

    delete_saved_game
    play
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
