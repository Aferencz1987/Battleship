require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/messages'
require './lib/computer'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_instance_of(Game)
  end



  it 'ends game' do
    game = Game.new
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @comp_submarine.hit
    expect(game.game_over?).to eq(false)
    @comp_submarine.hit
    @comp_cruiser.hit
    @comp_cruiser.hit
    @comp_cruiser.hit
    expect(@comp_cruiser.sunk?).to eq(true)
    expect(@comp_submarine.sunk?).to eq(true)

  require "pry"; binding.pry
    expect(@game.game_over?).to eq(true)
  end

  ## valid shot coordinates test??
end
