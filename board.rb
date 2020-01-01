require_relative 'common.rb'

class Board
  attr_accessor :word_length, :correct, :incorrect

  def initialize
    @correct = []
    @incorrect = []
    @word_length = 0
  end

  def display
    system('clear')

    print "word: "
    if correct.length == 0
      @word_length.times { |i| print '_ ' }
    else
      @correct.each { |letter| print "#{letter} " }
    end
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
end
