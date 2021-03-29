require './lib/ship'
require './lib/cell'

RSpec.describe Ship do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end
end
