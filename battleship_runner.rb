require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/messages'
require './lib/computer'
require './lib/turn'

@computer = Computer.new
@comp_board = Board.new
@comp_cruiser = Ship.new("Cruiser", 3)
@comp_submarine = Ship.new("Submarine", 2)
@comp_boats = [@comp_submarine, @comp_cruiser]

@player = Player.new
@player_board = Board.new
@player_cruiser = Ship.new("Cruiser", 3)
@player_submarine = Ship.new("Submarine", 2)
@player_boats = [@player_submarine, @player_cruiser]

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
  p @messages.place_ship_message + "\n" + "\n" + "Human_board" + "\n" +
     @player_board.render #+ "\n"

  end

  def computer_places_cruiser ########
    choices = []

    until @comp_board.valid_placement?(@comp_cruiser, choices) == true
      choices = @comp_board.cells.keys.sample(3)
    end
    @comp_board.place(@comp_cruiser, choices)
    @comp_board.render(true)
  end

  def computer_places_submarine #######
    choices = []
    until @comp_board.valid_placement?(@comp_submarine, choices) == true
      choices = @comp_board.cells.keys.sample(2)
    end
    @comp_board.place(@comp_submarine, choices)
    @comp_board.render(true)
  end

  def computer_place_both_ships #######
    computer_places_cruiser &&
    computer_places_submarine
    @comp_board.render(true)
  end
################### now into human land

  def player_places_cruiser
    @choice_count = 0
    until @choice_count == 1
      @user_input = gets.chomp.upcase.split
      # if @user_input !=
      if @player_board.valid_placement?(@player_cruiser, @user_input) == true
        @player_board.place(@player_cruiser, @user_input)
        @choice_count += 1
      # elsif @user_input != @player_board.cells.keys
      #  "try again"
      else
        p @messages.invalid_placement_message
        @user_input = gets.chomp.upcase.split
      end
    end
      @player_board.render(true)
  end
  # end

  def player_places_submarine

    @choice_count = 0
    until @choice_count == 1
      @user_input = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_submarine, @user_input) == true
        @player_board.place(@player_submarine, @user_input)
        @choice_count += 1
      #elsif @user_input != @player_board.cells.keys
      #  "try again"
      else
        p @messages.invalid_placement_message
      end
    end
      @player_board.render(true)
  end

  def player_place_both_ships
    player_places_cruiser &&
    player_places_submarine
    @player_board.render(true)
  end

  def make_it_purty ### add me in later!!!
    + "\n" + "================================" + "\n" +  "\n" +"Skynet board" + "\n" + computer_place_both_ships + "Good luck!"
  end

  def turn
    require "pry"; binding.pry
  end

puts player_place_both_ships

  # puts setup + computer_place_both_ships









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
