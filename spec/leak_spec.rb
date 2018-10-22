RSpec.describe Leak do
  it "has a version number" do
    expect(Leak::VERSION).not_to be nil
  end

  describe '.leak' do
    it 'leaks memory' do
      rss_last = Leak.rss
      5.times do
        Leak.leak
        rss_now = Leak.rss
        expect(rss_now).to be >= rss_last
        rss_last = rss_now
      end
    end
  end

  describe '.rss' do
    it 'returns the VM RSS for the process' do
      expect(Leak.rss).to be_an(Integer)
    end
  end

  describe '.mem_stats_header' do
    it 'returns a CSV header' do
      expect(Leak.mem_stats_header).to eq('t,rss,total_allocated_objects,total_freed_objects')
    end
  end


  describe '.mem_stats' do
    it 'returns a csv row of data' do
      expect(Leak.mem_stats).to match(/\d+\.\d{3},\d+,\d+,\d+/)
    end
  end
end
