class Computer
  def initialize
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @computer_board = computer_board
    @human_board = human_board

  end

  def computer_place_submarine
    until @board.valid_placement? == true
      #select the coordinates
    end
      @board.place(submarine, coordinates)

  end

  def computer_place_cruiser

      @board.place(cruiser, coordinates)
  end
end
