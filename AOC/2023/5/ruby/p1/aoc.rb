class AOC
  def initialize(io)
    @io = io
  end

  def run
    seeds = @io.gets("\n\n").split[1..].map(&:to_i)
    while (map = @io.gets("\n\n"))
      _type, *values = map.split "\n"
      values = values.map { |v| v.split.map(&:to_i) }
      seeds = next_seeds seeds, values
    end
    seeds.min
  end

  private

  def next_seeds(seeds, values)
    seeds.inject([]) do |nseeds, seed|
      nseeds << find_seed(seed, values)
    end
  end

  def find_seed(seed, values)
    next_seed = nil
    values.each do |(dest, src, range)|
      next_seed = dest + seed - src if mapped?(seed, src, range)
    end
    next_seed || seed
  end

  def mapped?(seed, src, range)
    (src..src + range - 1).include? seed
  end
end

return if ARGV.empty?

p AOC.new(File.open(ARGV.shift)).run
