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
    comp_boats = game.comp_boats
    comp_boats.each do |boat|
      boat.hit
      boat.hit
      boat.hit
    end
    
    expect(comp_boats[0].sunk?).to eq(true)
    expect(comp_boats[1].sunk?).to eq(true)
    expect(game.game_over?).to eq(true)
  end
end
