require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  describe 'board setup' do
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
  describe 'shows valid placement' do
    it 'compares length' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'checks for consecutive and low to high coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'checks for diagonal coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    xit 'checks for valid placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.cnc(submarine, ["A1", "A2"])).to eq(true)
      expect(board.cnc(submarine, ["B1", "B2"])).to eq(true)
      expect(board.clc(submarine, ["A1", "B1"])).to eq(true)
      expect(board.clc(submarine, ["B1", "C1"])).to eq(true)
    end

    it 'checks for valid placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      # require "pry"; binding.pry
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end
end
