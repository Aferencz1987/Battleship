# length_check(boat, coordinates) && cnc(boat, coordinates) #fails b1c1d1
# length_check(boat, coordinates) && clc(boat,coordinates) #a1a2
# cnc(boat, coordinates) && clc(boat,coordinates) #a1a2
# length_check(boat, coordinates) && cnc(boat, coordinates) && clc(boat,coordinates)
# require "pry"; binding.pry
# length_check(boat, coordinates) && consecutive_check(boat, coordinates) && !backwards?(boat, coordinates)
# boat.length == coordinates.length






#   def cnc(boat,coordinates)
#     result = []
#     coordinates.each do |coordinate|
#       result.push(coordinate.split(''))
#     end
#     letters = []
#     numbers = []
#     result.each do |split_coordinate|
#       letters.push(split_coordinate[0].ord) && numbers.push(split_coordinate[1].to_i)
#     end
#     results = false
#     numbers.each_cons(2) do |number|
#       # require "pry"; binding.pry
#       if number[1].to_i - number[0].to_i == 1
#         if letters.uniq.count == 1 || numbers.uniq.count == 1
#           results = true
#         end
#       end
#     end
#     results
#   end
#
#   def clc(boat,coordinates)
#     result = []
#     coordinates.each do |coordinate|
#       result.push(coordinate.split(''))
#     end
#     letters = []
#     numbers = []
#     result.each do |split_coordinate|
#       letters.push(split_coordinate[0].ord) && numbers.push(split_coordinate[1].to_i)
#     end
#     results = false
#     letters.each_cons(2) do |letter|
#       if letter[1] - letter[0] == 1
#         numbers.each_cons(2) do |number|
#           if number[1].to_i - number[0].to_i == 0
#             if letters.uniq.count == 1 || numbers.uniq.count == 1
#           results = true
#             end
#           end
#         end
#       end
#     end
#     results
#   end
# end


# same letters horizontal_placement?
# letters[1].to_i - letters[0].to_i == 0 && numbers[1] - numbers[0] == 1 && letters.uniq.count == 1 || numbers.uniq.count == 1
# ||
# letters[1].to_i - letters[0].to_i == 1 && numbers[1] - numbers[0] == 0 && letters.uniq.count == 1 || numbers.uniq.count == 1
# same numbers verticle_placement












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
