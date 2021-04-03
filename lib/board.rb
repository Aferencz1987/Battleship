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
    (length_check(boat, coordinates) && consecutive_check(boat, coordinates)) &&
    (letter_check(boat, coordinates) || number_check(boat, coordinates))
  end

  def length_check(boat, coordinates)
    boat.length == coordinates.length
  end

  def consecutive_numbers?(boat, coordinates)
    @num = coordinates.map do |coordinate|
      coordinate[1].to_i
    end
    @num.each_cons(2).all? do |a,b|
      b == a + 1
    end
  end

  def consecutive_letters?(boat, coordinates)
    @let= coordinates.map do |coordinate|
      coordinate[0].ord
    end
    @let.each_cons(2).all? do |a,b|
      b == a + 1
    end
  end

  def consecutive_check(boat, coordinates)
    (!consecutive_numbers?(boat, coordinates) && consecutive_letters?(boat, coordinates)) ||
    (consecutive_numbers?(boat, coordinates) && !consecutive_letters?(boat, coordinates))
  end

  def number_check(boat, coordinates)
    result = coordinates.map do |coordinate|
      coordinate.split('')
    end

    numbers = []
    result.each do |split_coordinate|
      numbers.push(split_coordinate[1].to_i)
    end
    if numbers.uniq.count == 1
      true
    else
      false
    end
  end

  def letter_check(boat, coordinates)
    result = coordinates.map do |coordinate|
      coordinate.split('')
    end
    letters = []
    result.each do |split_coordinate|
      letters.push(split_coordinate[0].ord)
    end
    if letters.uniq.count == 1
      true
    else
      false
    end
  end

  def place(boat, coordinates)

  end
end
