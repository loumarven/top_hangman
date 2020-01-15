class Board
  attr_accessor :word_length, :correct, :incorrect

  def initialize
    @correct = []
    @incorrect = []
    @word_length = 0
    @moves = 0
  end

  def display
    system('clear')

    puts "Hangman Game"
    show_hangman(@incorrect.length)

    print "word: "
    if correct.length == 0
      @word_length.times { |i| print '_ ' }
    else
      @correct.each { |letter| print "#{letter} " }
    end
    puts

    print "incorrect guesses: "
    p @incorrect
  end

  def correct=(guesses)
    @correct = guesses
  end

  def incorrect=(guesses)
    @incorrect = guesses
  end

  private
  def show_hangman(level)
    hangman = [
               '
                +------+
                |      |
                       |
                       |
                       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
                       |
                       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
                |      |
                       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
              / |      |
                       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
               /|\     |
                       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
               /|\     |
               /       |
                       |
                    =======',
               '
                +------+
                |      |
                O      |
               /|\     |
               / \     |
                       |
                    ======='
             ]

    puts hangman[level]
    puts
  end
end
