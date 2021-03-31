class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def ship_placed?
    return true if @ship == ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !@empty
      ship.hit
    # elsif ship == nil
    #   @ship = 0
    # elsif ship.health == 0
    #   p "health is zero"
    end
  end

  def render(unhide = false)
    # require "pry"; binding.pry
    if @empty && !@fired_upon
      "."
    elsif !@empty && !@fired_upon && unhide
      "S"
    elsif @empty && @fired_upon
      "M"
    elsif !@empty && @fired_upon
      "H"
    else !@empty && ship.sunk?
      "X"
    end

  end

#   def render(render = false)
#     if render(false)
#       if @fired_upon == true && @empty == true
#         miss_cell_message
#       else @fired_upon == false && @empty == false
#         hit_cell_message
#       end
#         else @fired_upon == false
#           blank_cell_message
#     end
# ###########
#     if @fired_upon == true
#       if @empty == true
#         miss_cell_message
#       else @empty == false
#         hit_cell_message
#       end
#       else @fired_upon == false && render(true)
#         blank_cell_message
#         elsif render(true)
#     end
#   end

  # def blank_cell_message
  #   "."
  # end
  #
  # def miss_cell_message
  #   "M"
  # end
  #
  # def hit_cell_message
  #   "H"
  # end
  #
  # def show_ship
  #   "S"
  # end


end

# if @ship != nil
#   if @fired_upon == true && @empty == true
#     miss_cell_message
#   elsif @fired_upon == true && @empty == false
#     hit_cell_message
#   else
#     p "You fucked up!"
#   end
# elsif @ship == nil && @fired_upon == false
