require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/messages'
require './lib/computer'
require './lib/turn'

@board = Board.new
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)
@boats = [@submarine, @cruiser]
@player = Player.new
@computer = Computer.new
@game = Game.new
@turn = Turn.new
@messages = Messages.new

  def start
  p @messages.welcome_message
    @response = gets.chomp
    if @response.downcase == 'p'
      setup
    elsif @response.downcase == 'q'
      p @messages.quit_message
    end
  end

  def setup
  puts @messages.place_ship_message
     @board.render + "\n"
  end

  def computer_place_ships
    choice = []
    until @board.valid_placement?(boat, choice) == true
      @boats.each do |boat|
        choice.push(@board.cells.keys.sample(boat.length))
      end
    end
    choice
    require "pry"; binding.pry
  end
## we are trying to figure out how to get line 37 to have arguments from the each thing 

  #
  #   @board.render
  # end

  puts computer_place_ships

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
  #
  #   def turn_loop
  #     until game.winner
  #       player.shoot
  #         if valid_coordinate == true
  #           render && feedback
  #         else
  #           error_code
  #         end
  #       computer.shoot
  #         until valid_coordinate == true
  #           generate_new_shot
  #         end
  #         render
  #       end
  #     end
  #   end
  # end
  #
  # d
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
  #
  #
  # def human_board
  # #   @board.render(unhide)
  # # end
