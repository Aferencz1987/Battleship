def end_game
  if comp_submarine.sunk? && comp_cruiser.sunk? == true ||
    player_submarine.sunk? && player_cruiser.sunk? == true
   if
end


###how to get to sunk?
# @player_board.cells["A2"].ship.sunk?

if @player_board.cells[@shot_input].render == "M"
  p "miss"
elsif @player_board.cells[@shot_input].render == "H"
  p "hit"
elsif @player_board.cells[@shot_input].ship.sunk? == true
  p "You sunk my #{@player_board.cells[@shot_input].ship.name}"
end




turn
  player choose a coordinate
  @player_board.
  &&
  computer choose a coordinate


  shots_fired = []
  shot_input = gets.chomp
  if shots_fired.include?(shot_input) != true
    @computer_board.cell.fire_upon
    shots_fired.push(shot_input)
  else
    p try again message
  end

  @player_board.cells.find do |cell|
     cell.coordinate == @shot_input
   end

   @player_board.cells.each do |name, cell_info|
     if cell_info.coordinate == @shot_input


    @player_board.cells.each do |cell|
      if cell.keys == @shot_input
        cell.fire_upon
      end

      shots_fired = []
      if shot_input == player_board.cells.keys
        shots_fired.push(key)
        @player_board.cells.each do |cell|
