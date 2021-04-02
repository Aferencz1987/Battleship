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
    # length_check(boat, coordinates) && cnc(boat, coordinates) #fails b1c1d1
    length_check(boat, coordinates) && clc(boat,coordinates) #a1a2
    # cnc(boat, coordinates) && clc(boat,coordinates) #a1a2
    # length_check(boat, coordinates) && cnc(boat, coordinates) && clc(boat,coordinates)
    # require "pry"; binding.pry
    # length_check(boat, coordinates) && consecutive_check(boat, coordinates) && !backwards?(boat, coordinates)
    # boat.length == coordinates.length
  end

  def length_check(boat, coordinates)
    boat.length == coordinates.length
  end

  # def cnc(boat,coordinates)
  #   result = []
  #   coordinates.each do |coordinate|
  #     result.push(coordinate.split(''))
  #   end
  #   letters = []
  #   numbers = []
  #   result.each do |split_coordinate|
  #     letters.push(split_coordinate[0].ord) && numbers.push(split_coordinate[1].to_i)
  #   end
  #   results = false
  #   numbers.each_cons(2) do |number|
  #     # require "pry"; binding.pry
  #     if number[1].to_i - number[0].to_i == 1
  #       if letters.uniq.count == 1 || numbers.uniq.count == 1
  #         results = true
  #       end
  #     end
  #   end
  #   results
  # end

  def clc(boat,coordinates)
    result = []
    coordinates.each do |coordinate|
      result.push(coordinate.split(''))
    end
    letters = []
    numbers = []
    result.each do |split_coordinate|
      letters.push(split_coordinate[0].ord) && numbers.push(split_coordinate[1].to_i)
    end
    results = false
    letters.each_cons(2) do |letter|
      if letter[1] - letter[0] == 1
        numbers.each_cons(2) do |number|
          if number[1].to_i - number[0].to_i == 0
            if letters.uniq.count == 1 || numbers.uniq.count == 1
          results = true
            end
          end
        end
      end
    end
    results
  end
end



# if letters[1].to_i - letters[0].to_i == 0 && numbers[1] - numbers[0] == 1 || letters[1].to_i - letters[0].to_i == 1 && numbers[1] - numbers[0] == 0













  # Dont erase this!!!!
  # def consecutive_check(boat,coordinates)
  #   result = []
  #   coordinates.each do |coordinate|
  #     result.push(coordinate.split(''))
  #   end
  #   letters = []
  #   numbers = []
  #   result.each do |split_coordinate|
  #     letters.push(split_coordinate[0].ord) && numbers.push(split_coordinate[1].to_i)
  #   end
  #   result = false
  #   numbers.each_cons(2) do |number|
  #    if number[1].to_i - number[0].to_i == -1
       # if letters.uniq.count == 1 || numbers.uniq.count == 1
  #        result = true
  #        # require "pry"; binding.pry
  #      end
  #     end
  #   end
  #   result
  # end

  # def backwards?(boat, coordinates)
  #   result = []
  #   coordinates.each do |coordinate|
  #     result.push(coordinate.split(''))
  #   end
  #   letters = []
  #   numbers = []
  #   result.each do |split_coordinate|
  #     letters.push(split_coordinate[0]) && numbers.push(split_coordinate[1])
  #   end
  #   result = false
  #   numbers.each_cons(2) do |number|
  #     number[1].to_i - number[0].to_i == 1
  #     result = true
  #   end
  #   result
  # end


# if letters[1].to_i - letters[0].to_i == 0 && numbers[1] - numbers[0] == 1 || letters[1].to_i - letters[0].to_i == 1 && numbers[1] - numbers[0] == 0

# letter[0] - letter[1] == 0 && numbers[0] - numbers[1] == 1
# or
# letters[0] - letters[1] == 1 && numbers[0] - numbers[1] == 0




# different number same letter spoiler, it worked!
# numbers.each_cons(2) do |number|
#  if number[1].to_i - number[0].to_i == -1
#    if letters.uniq.count == 1 || numbers.uniq.count == 1
#      p 'sucess diff num same letter'
#    else
#      p 'this didnt work'
#    end
#  end
# end
# mess with the one below!!!!!

# def test(boat, coordinate)
#   result = false
#   numbers.each_cons(2) do |number|
#    if number[1].to_i - number[0].to_i == -1
#      if letters.uniq.count == 1 || numbers.uniq.count == 1
#        result = true
#      end
#    end
#   end
# end
