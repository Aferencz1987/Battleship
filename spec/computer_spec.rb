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
end
