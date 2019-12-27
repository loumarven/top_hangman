require './common.rb'
require './board.rb'

class Computer
  attr_reader :secret_word, :guess_state

  def initialize
    @secret_word = nil
    @guess_state = []
  end

  def gen_secret_word
    @dictionary = File.open('./5desk.txt', 'r')
    # read contents, newline delimited
    @secret_word = @dictionary.readlines
                              .map(&:chomp)
                              .select { |word| word.length >= 5 && word.length <= 12 }
                              .sample
    File.close('./5desk.txt')

    init_guess_state
  end

  def letter_exists?(letter)
    @secret_word.include?(letter)
  end

  def update_guess(letter)
    # replace '_' with letter for all matches/occurences
    @secret_word.split('').each_with_index do |s, i|
      guess_state[i] = s if s == letter
    end
  end

  def correct_guess
  end

  private
  def init_guess_state
    @secret_word.length.to_i.times { @guess_state << '-' }
  end
end

