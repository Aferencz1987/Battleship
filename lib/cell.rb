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

  def place_ship(boat)
    @ship = boat
    @empty = false
  end

  def ship_placed?
    return true if @ship == ship #!!!!!!! Here is the problem if ship/boat stuff is not placed
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !@empty
      ship.hit
    end
  end

  def render(unhide = false)
    if @empty && !@fired_upon
      "."
    elsif !@empty && !@fired_upon && unhide
      "S"
    elsif @empty && @fired_upon
      "M"
    elsif !@empty && @fired_upon && !ship.sunk?
      "H"
    elsif !@empty && ship.sunk?
      "X"
    else
      "."
    end
  end
end
