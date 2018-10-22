require "leak/version"
require "leak/leak"

module Leak
  def self.rss
    `ps -o rss -p #{$$}`.lines.last.strip.to_i
  end

  STATS = {
    't' =>  ->() { Time.now.strftime('%s.%L') },
    'rss' =>  ->() { rss },
    'total_allocated_objects' =>  ->() { GC.stat[:total_allocated_objects] },
    'total_freed_objects' => ->() { GC.stat[:total_freed_objects] }
  }.freeze

  def self.mem_stats_header
    STATS.keys.join(',')
  end

  def self.mem_stats
    STATS.values.map { |f| f.call }.join(',')
  end
end
