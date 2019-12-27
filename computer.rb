require './common.rb'
require './board.rb'

class Computer
  attr_reader :secret_word, :correct_guesses, :incorrect_guesses

  def initialize
    @secret_word = nil
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def gen_secret_word
    @dictionary = File.open('./5desk.txt', 'r')
    # read contents, newline delimited
    @secret_word = @dictionary.readlines
                              .map(&:chomp)
                              .select { |word| word.length >= 5 && word.length <= 12 }
                              .sample
    File.close('./5desk.txt')

    init_correct_guesses
  end

  def letter_exists?(letter)
    @secret_word.include?(letter)
  end

  def update_correct(letter)
    # replace '_' with letter for all matches/occurences
    @secret_word.split('').each_with_index do |s, i|
      @correct_guesses[i] = s if s == letter
    end
  end

  def update_incorrect(letter)
    @incorrect_guesses << letter
  end

  private
  def init_correct_guesses
    @secret_word.length.to_i.times { @correct_guesses << '_' }
  end
end

