class Game
  attr_reader :comp_boats, :player_boats
  def initialize
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
    @messages = Messages.new
  end

  def restart
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
    @messages = Messages.new
    start
  end

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

  def computer_place_both_ships
    computer_places_cruiser +
    computer_places_submarine
    puts "COMPUTER BOARD"
    puts @comp_board.render(false)
  end

  def computer_places_cruiser
    choices = []
    until @comp_board.valid_placement?(@comp_cruiser, choices) == true
      choices = @comp_board.cells.keys.sample(3)
    end
    @comp_board.place(@comp_cruiser, choices)
  end

  def computer_places_submarine
    choices = []
    until @comp_board.valid_placement?(@comp_submarine, choices) == true
      choices = @comp_board.cells.keys.sample(2)
    end
    @comp_board.place(@comp_submarine, choices)
  end

  def computer_shoots
    @shot_input = @player_board.cells.keys.sample
    if @player_board.cells[@shot_input].fired_upon? == false
    @player_board.cells[@shot_input].fire_upon
  else
    @shot_input = @player_board.cells.keys.sample
    @player_board.cells[@shot_input].fire_upon
  end
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
     puts "Enter 3 consecutive coordinates to place your cruiser. Example: A1 A2 A3. Don't forget the spaces between coordinates!"
    @choice_count = 0
    until @choice_count == 1
      @user_input = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_cruiser, @user_input) == true
        @player_board.place(@player_cruiser, @user_input)
        @choice_count += 1
      elsif
         puts @messages.invalid_placement_message
      end
    end
  end

  def player_places_submarine
    puts "Enter 2 consecutive coordinates to place your submarine. Example: A1 A2  Don't forget the spaces between coordinates!"
    @choice_count = 0
    until @choice_count == 1
      @submarine_input = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_submarine, @submarine_input) == true
        @player_board.place(@player_submarine, @submarine_input)
        @choice_count += 1
      else
         puts @messages.invalid_placement_message
      end
    end
  end

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
    restart
  end

  def game_over?
     (@comp_submarine.sunk? && @comp_cruiser.sunk?) ||
     (@player_submarine.sunk? && @player_cruiser.sunk?)
  end
end
