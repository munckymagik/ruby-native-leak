RSpec.describe Leak do
  it "has a version number" do
    expect(Leak::VERSION).not_to be nil
  end

  describe '#leak' do
    it 'leaks some memory' do
      expect(Leak.leak).to eq(nil)
    end
  end

  describe '#rss' do
    it 'returns the VM RSS for the process' do
      expect(Leak.rss).to be_an(Integer)
    end
  end
end
