require './common'

class Board
  attr_accessor :word
  attr_reader :incorrect_guesses

  def initialize
    @word = nil
    @incorrect_guesses = []
  end

  def display
  end

  def save_correct(letter)
  end

  def save_incorrect(letter)
    incorrect_guesses << letter
  end
end
