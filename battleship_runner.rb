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
   puts @messages.welcome_message
    @response = gets.chomp
    if @response.downcase == 'p'
      setup
    elsif @response.downcase == 'q'
      puts @messages.quit_message
    end
  end

  def setup
  puts @messages.place_ship_message + "\n" + "\n" + "Sample Board" + "\n" +
     @player_board.render + "\n"
     puts player_place_both_ships
     computer_place_both_ships

  end




  def computer_place_both_ships #######
    computer_places_cruiser +
    computer_places_submarine
    puts "COMPUTER BOARD"
    puts @comp_board.render(false)
  end

  def computer_places_cruiser ########
    choices = []

    until @comp_board.valid_placement?(@comp_cruiser, choices) == true
      choices = @comp_board.cells.keys.sample(3)
    end
    @comp_board.place(@comp_cruiser, choices)
    #@comp_board.render(true)
  end

  def computer_places_submarine #######
    choices = []
    until @comp_board.valid_placement?(@comp_submarine, choices) == true
      choices = @comp_board.cells.keys.sample(2)
    end
    @comp_board.place(@comp_submarine, choices)
  #  @comp_board.render(true)
  end

  def computer_shoots
    # sleep(2)
    @shot_input = @player_board.cells.keys.sample
    if @player_board.cells[@shot_input].fired_upon? == false
    @player_board.cells[@shot_input].fire_upon
  else
    @shot_input = @player_board.cells.keys.sample
    @player_board.cells[@shot_input].fire_upon
  end
    #something about cell.fired_upon? == false
    # require "pry"; binding.pry
    if @player_board.cells[@shot_input].render == "M"
      "My shot on #{@shot_input} was a miss"
    elsif @player_board.cells[@shot_input].render == "H"
      "My shot on #{@shot_input} was a hit"
    elsif @player_board.cells[@shot_input].ship.sunk? == true
      "I sunk your #{@player_board.cells[@shot_input].ship.name}"
    end
  end

################### now into human land
  def player_place_both_ships
    player_places_cruiser
    player_places_submarine
    puts "PLAYER BOARD"
    @player_board.render(true)
  end

  def player_places_cruiser
     puts "Enter 3 consecutive coordinates to place your cruiser. Example: A1 A2 A3"
    @choice_count = 0
    until @choice_count == 1
      @user_input = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_cruiser, @user_input) == true
        @player_board.place(@player_cruiser, @user_input)
        @choice_count += 1
      elsif
         puts @messages.invalid_placement_message
        @user_input = gets.chomp.upcase.split
      end
    end
    #  @player_board.render(true)
  end

  def player_places_submarine
    puts "Enter 2 consecutive coordinates to place your submarine. Example: A1 A2"
    @choice_count = 0
    until @choice_count == 1
      @submarine_input = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_submarine, @submarine_input) == true
        @player_board.place(@player_submarine, @submarine_input)
        @choice_count += 1
      elsif
         puts @messages.invalid_placement_message
         @user_input = gets.chomp.upcase.split
      end
    end
    #  @player_board.render(true)
  end
#####NEW
  def valid_shot_coordinates
    @comp_board.cells.keys
  end

  def player_shoots
    puts 'Enter a coorinate to fire on'
    @choice_count = 0
    until @choice_count == 1
      @shot_input = gets.chomp.upcase
      if valid_shot_coordinates.include?(@shot_input) == false
        puts "Please enter a valid coordinate"
      elsif @comp_board.cells[@shot_input].fired_upon? == false
        @comp_board.cells[@shot_input].fire_upon
        @choice_count += 1
        if @comp_board.cells[@shot_input].render == "M"
           puts "Your shot on #{@shot_input} was a miss"
        elsif @comp_board.cells[@shot_input].render == "H"
           puts "Your shot on #{@shot_input} was a hit"
        elsif @comp_board.cells[@shot_input].ship.sunk? == true
           puts "You sunk my #{@comp_board.cells[@shot_input].ship.name}"
        end
      elsif
        puts "You've already fired on that coordinate, please try again."
        @shot_input = gets.chomp.upcase
      end
    end
  end

    ###################################OLD
  #   @choice_count = 0
  #   until @choice_count == 1
  #     @shot_input = gets.chomp.upcase
  #     if @comp_board.cells[@shot_input].fired_upon? == false
  #       @comp_board.cells[@shot_input].fire_upon
  #       @choice_count += 1
  #       require "pry"; binding.pry
  #       if @comp_board.cells[@shot_input].render == "M"
  #          "Your shot on #{@shot_input} was a miss"
  #       elsif @comp_board.cells[@shot_input].render == "H"
  #          "Your shot on #{@shot_input} was a hit"
  #       elsif @comp_board.cells[@shot_input].ship.sunk? == true
  #          "You sunk my #{@comp_board.cells[@shot_input].ship.name}"
  #       end
  #     elsif
  #       puts "You've already fired on that coordinate, please try again."
  #       @shot_input = gets.chomp.upcase
  #     end
  #   end
  # end

  def turn
    until game_over?
      puts player_shoots
      puts computer_shoots
      puts "PLAYER BOARD"
      puts @player_board.render(true)
      puts "COMPUTER BOARD"
      puts @comp_board.render(false)#turn to false
    end
    if @comp_submarine.sunk? && @comp_cruiser.sunk? == true
      puts "You beat me :("
    elsif @player_submarine.sunk? && @player_cruiser.sunk? == true
      puts "You never stood a chance!"
    end
    start
  end

  def game_over?
     @comp_submarine.sunk? && @comp_cruiser.sunk? == true ||
     @player_submarine.sunk? && @player_cruiser.sunk? == true
  end
  # refactor to helper method of computer_sunk? and player_sunk?
  # def make_it_purty ### add me in later!!!
  #   + "\n" + "================================" + "\n" +  "\n" +"Skynet board" + "\n" + computer_place_both_ships + "Good luck!"
  # end

  # puts player_shoots
puts start
puts turn

  # puts setup + computer_place_both_ships
