require "leak/version"
require "leak/leak"

module Leak
  def self.rss
    `ps -o rss -p #{$$}`.lines.last.strip.to_i
  end
end
