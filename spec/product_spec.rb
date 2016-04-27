
describe Product do
  subject { Product.new('019', 'name', 0.99) }

  it 'should return correct product code' do
    expect(subject.code).to eq('019')
  end

  it 'should return correct product name' do
    expect(subject.name).to eq('name')
  end

  it 'should return correct price' do
    expect(subject.price).to eq(0.99)
  end
end