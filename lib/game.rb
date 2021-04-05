class Game
  attr_reader :response
  def initialize
    @messages = Messages.new
    @board = Board.new
    @response = ""

  end

  def start
    computer.random_boat
     puts @messages.welcome_message +
      @messages.printz
      response = gets.chomp
      if response == 'p'
      #do game stuff
    elsif response == 'q'
        @messages.quit_message
    end
    response
  end

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


end
