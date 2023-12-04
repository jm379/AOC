class AOC
  MAX = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }.freeze

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
    game, *subsets = line.split(/:|;/)
    possible?(subsets) ? game[/\d+/].to_i : 0
  end

  def possible?(subsets)
    subsets.each do |subset|
      subset.split(',').each do |cube|
        count = cube[/\d+/].to_i
        color = cube[/[a-z]+/]
        return false if count > MAX[color]
      end
    end
    true
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
