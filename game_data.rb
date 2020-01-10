class GameData
  attr_reader :player, :computer, :board, :winner

  def initialize(player, computer, board, winner)
    @player = player
    @computer = computer
    @board = board
    @winner = winner   
  end
end
