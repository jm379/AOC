class AOC
  def initialize(str)
    @str = str
  end

  def run
    @str.each_line.inject(0) do |sum, line|
      sum + game(line)
    end
  end

  private

  def game(line)
    _game, subsets = line.split ':'
    max(subsets).reduce :*
  end

  def max(subsets)
    rgb = {
      'red' => 0,
      'green' => 0,
      'blue' => 0
    }
    subsets.split(/,|;/).each do |cube|
      color = cube[/[a-z]+/]
      count = cube[/\d+/].to_i
      rgb[color] = count if rgb[color] < count
    end

    rgb.values
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
