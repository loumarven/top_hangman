require './common'

class Board
  attr_accessor :word, :correct, :incorrect

  def initialize
    @word = nil
    @correct = nil
    @incorrect = nil
    @attempts = 6
  end

  def display
    system('clear')

    print "correct guesses: "
    p @correct
    puts

    print "incorrect guesses: "
    p @incorrect
    puts
  end

  def correct=(guesses)
    @correct = guesses
  end

  def incorrect=(guesses)
    @incorrect = guesses
  end

  def update_stickman
    @attempts = @attempts - 1
  end
end
