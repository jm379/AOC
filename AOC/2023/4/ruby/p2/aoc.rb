class AOC
  def initialize(str)
    @str = str
    @stack = [0]
  end

  def run
    @str.lines(chomp: true).reduce(0) do |sum, line|
      sum + calc(line)
    end
  end

  private

  def calc(line)
    add_cards_to_stack winners(*parse(line)).size
    cards = @stack.delete_at 0
    cards.to_i + 1
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

  def add_cards_to_stack(winners_count)
    winners_count.times do |i|
      @stack[1 + i] = @stack[1 + i].to_i + @stack[0].to_i + 1
    end
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
