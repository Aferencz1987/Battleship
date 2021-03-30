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

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if ship != nil && ship.health > 0
      ship.hit
    elsif ship == nil
      @ship = 0
    elsif ship.health == 0
      p "health is zero"
    end
  end

  def render(render = false)
      if @fired_upon == true
        if @empty == true
          miss_cell_message
        else @empty == false
          hit_cell_message
        end
      elsif @fired_upon == false && render(true)
        show_ship
      else @fired_upon == false && render
        blank_cell_message
      end
      end
    # if render(true) && @empty == false
    #   p "S"
    #   break
    # end
  end

  # def render_changer
  #   render(true)
  # end

  def blank_cell_message
    "."
  end

  def miss_cell_message
    "M"
  end

  def hit_cell_message
    "H"
  end

  def show_ship
    "S"
  end


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
