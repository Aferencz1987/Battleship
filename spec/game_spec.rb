require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/game'
require './lib/messages'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_instance_of(Game)
    expect(game.start).to eq("blah")
  end
end
