require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/messages'
require './lib/computer'

RSpec.describe do
  it 'exists' do
    computer = Computer.new
    expect(computer).to be_instance_of(Computer)
  end

  it 'places submarines' do
    computer = Computer.new
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    expect(cell_1.ship).to eq(submarine)
    # board.place(submarine, ["A1", "B1"])
    # computer.computer_place_submarine
    #
    # expect(computer)
  end
end
