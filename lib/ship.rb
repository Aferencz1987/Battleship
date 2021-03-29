class Ship
  attr_reader :name, :length, :health
  def initialize(name_parameter, length_parameter)
    @name = name_parameter
    @length = length_parameter
    @health = length_parameter
    @sunk = false
  end

  def sunk?
    if @health > 0
      sunk = false
    else @health == 0
      sunk = true
    end
  end

  def hit
    @health -= 1
  end
end
