require_relative './stock_picker'

RSpec.describe 'Stock Picker' do

  it 'gets the max profit' do
    expect(stock_picker([3,6,9,15,8,6,1,10])).to eq([0, 3])
  end

  it 'gets max profit when highest day is first and lowest day is last' do
    expect(stock_picker([17,3,6,9,15,8,6,10,1])).to eq([1, 4])
  end

end
