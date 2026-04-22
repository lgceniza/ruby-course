require_relative './caesar_cipher'

RSpec.describe 'Caesar Cipher' do

  it 'shifts to the right correctly' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
  end

  it 'ignores empty strings' do
    expect(caesar_cipher('', 1)).to eq('')
  end

end
