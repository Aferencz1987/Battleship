class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinates)
    result = false
    cells.each do |name_key, cell_info|
      if cell_info.coordinate.include?(coordinates)
         result = true
      end
    end
    result
  end

  def valid_placement?(boat, coordinates)
    length_check(boat, coordinates)
    # boat.length == coordinates.length
  end

  def length_check(boat, coordinates)
    boat.length == coordinates.length
  end

  def consecutive_check(boat,coordinates)
    result = []
    coordinates.each do |coordinate|
      # require "pry"; binding.pry
      result.push(coordinate.split(''))
    end
    letters = []
    numbers = []
    result.each do |split_coordinate|
      letters.push(split_coordinate[0]) && numbers.push(split_coordinate[1])
    end
    letters
    require "pry"; binding.pry
  end
end
# different number same letter spoiler, it worked!
# numbers.each_cons(2) do |number|
#  if number[1].to_i - number[0].to_i == -1
#    if letters.uniq.count == 1
#      p 'sucess diff num same letter'
#    else
#      p 'this didnt work'
#    end
#  end
# end
