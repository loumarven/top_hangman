require './common.rb'
require './board.rb'

class Computer
  def initialize
  end

  def secret_word
    @dictionary = File.open('./5desk.txt', 'r')
    # read contents, newline delimited
    @secret_word = @dictionary.readlines
                              .map(&:chomp)
                              .select { |word| word.length >= 5 && word.length <= 12 }
                              .sample
    puts "secret word: #{@secret_word}"
  end
end

