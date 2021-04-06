class Player
  def initialize
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new

  end
  # 
  # def display_board
  #   board.render
  # end
  # def shoot(coordinate) ## this needs to be the gets.chomp from turn
  #
  # end
end

# def human_board
#   @board.render(unhide)
# end
