class AOC
  def initialize(str)
    @str = str
  end

  def run
    @str.lines(chomp: true).reduce(0) do |sum, line|
      sum + calc(line)
    end
  end

  private

  def calc(line)
    1 << winners(*parse(line)).size - 1
  end

  def parse(line)
    _card, winning, bet = line.split(/:|\|/)
    [
      winning.split,
      bet.split
    ]
  end

  def winners(winning, bet)
    winning & bet
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
