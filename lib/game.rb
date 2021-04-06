class Game
  # attr_reader :response, :board, :messages
  def initialize
    # @messages = Messages.new
    # @board = Board.new
    # @response = ""
  end

  # def start
  #   #start should render the board
  #  puts @messages.welcome_message +
  #   @messages.printz
  #   response = gets.chomp
  #   if response == 'p'
  #   #do game stuff
  #   # elsif response == 'q'
  #   #   @messages.quit_message
  #   end
  #   # # response
  # end
  #
  # def computer_feedback
  #   if cell.render == "M"
  #     "miss"
  #   elsif
  #     cell.render == "H"
  #     "hit"
  #   else
  #     cell.render == "X"
  #     "ship has been sunk"
  #   end
  # end
  #
  # def winner
  #   return "human" if
  #   require "pry"; binding.pry
  #     player.ship.all? |boat|
  #     boat.sunk? == true
  #   return "computer" if
  #     computer.ship.all? |boat|
  #     boat.sunk? == true
  # end
end
# end

  # def random_boat
  #   choices = [submarine, cruiser]
  #   choices.sample
  # end
  #
  # def computer_place_submarine
  #   p @messages.place_ship_message
  #   #something happens that creates a random selection of boat and then their coordinates.
  #   #that will then be assigned as the arguments of board.place
  #   if random_boat == submarine
  #     @board.place(submarine, coordinates)
  #     @board.valid_placement
  #   else
  #     computer_place_cruiser
  #   end
  # end
  #
  # def computer_place_cruiser
  #   p @messages.place_ship_message
  #   if random_boat == cruiser
  #
  #     @board.place(cruiser, coordinates)
  #   else
  #     computer_place_submarine
  #   end
  # end
