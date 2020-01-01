require_relative 'common.rb'

class Player
  attr_accessor :attempts
  attr_reader :player_name, :guess

  def initialize(player_name, attempts)
    @player_name = player_name
    @attempts = attempts
  end

  def get_guess_letter
    print "Enter guess letter: "
    @guess = gets.chomp
  end

  def dead?
    @attempts == 0
  end
end
