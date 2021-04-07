require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/messages'
require './lib/computer'
require './lib/turn'

@game = Game.new

puts @game.start
puts @game.turn
