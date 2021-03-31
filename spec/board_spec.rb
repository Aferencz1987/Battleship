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
    expect(board.cells.values[0].class).to be(Cell)

  end

  it 'has 16 key/value pairs' do
    board = Board.new
    expect(board.cells.length).to eq(16)
  end

  it 'shows valid coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to be(true)
    expect(board.valid_coordinate?("D4")).to be(true)
    expect(board.valid_coordinate?("A5")).to be(false)
    expect(board.valid_coordinate?("E1")).to be(false)
    expect(board.valid_coordinate?("A22")).to be(false)
  end
end
