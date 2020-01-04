class Player
  attr_accessor :attempts
  attr_reader :player_name

  def initialize(player_name, attempts)
    @player_name = player_name
    @attempts = attempts
  end

  def get_guess_letter
    guess = ''

    loop do
      print "Enter guess letter: "
      guess = gets.chomp.downcase

      if alphabet?(guess)
        break
      else
        puts "Enter a character between A and Z only. Try again."
      end
    end

    guess
  end

  def dead?
    @attempts == 0
  end

  private
  def alphabet?(char)
    char.match(/[[:alpha:]]/)
  end
end
