require "./common.rb"

class Player
  attr_reader :player_name, :guess

  def initialize(player_name)
    @player_name = player_name
  end

  def get_guess_letter
    print "Enter guess letter: "
    @guess = gets.chomp
  end
end
