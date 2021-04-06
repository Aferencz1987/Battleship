class Computer
  attr_reader :computer_board, :human_board
  def initialize
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new

    # @shots = shots
   end
  #
  # def computer_place_submarine
  #   until @board.valid_placement? == true
  #     #select the coordinates
  #   end
  #     @board.place(submarine, coordinates)
  #
  # end
  #
  # def computer_place_cruiser
  #
  #     @board.place(cruiser, coordinates)
  # end
  #
  # def generate_shot
  #   @shots = []
  #   #as it takes a shot, the shot is pushed into shots array
  #   cells.each do |cell|
  #     shots.push(cell.keys.sample)
  #   end
  #     shots[-1]
  # end
  #
  # def computer_board
  #   @board.render
  # end
end
