class AOC
  MAP = {
    'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
    'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9,
    '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }.freeze

  def initialize(str)
    @str = str
  end

  def run
    @str.each_line.inject(0) do |sum, line|
      sum + digit(line)
    end
  end

  private

  def digit(line)
    pat = MAP.keys
    rpat = pat.map(&:reverse)
    digits = line.scan Regexp.union(pat)
    rdigits = line.reverse.scan Regexp.union(rpat)

    MAP[digits[0]] * 10 + MAP[last(digits[-1], rdigits[0])]
  end

  def last(digit, rdigit)
    rdigit.reverse!
    return digit if digit == rdigit

    rdigit
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
