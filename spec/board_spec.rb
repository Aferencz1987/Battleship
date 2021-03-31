require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_instance_of(Board)
  end

  it 'has a hash of cells' do
    board = Board.new
    # require "pry"; binding.pry
    expect(board.cells).to be_instance_of(Hash)
  end

  it 'has 16 key/value pairs' do
  board = Board.new
  expect(board.cells.length).to eq(16)
  end
end
