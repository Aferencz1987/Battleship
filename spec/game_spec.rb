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
    # expect(game.start).to eq("test failure")
  end

  it 'places computer selection' do
    game = Game.new
    computer = Computer.new
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    expect(game.computer_place(submarine, ["C4","D4"])).to eq("blah")
  end
end
