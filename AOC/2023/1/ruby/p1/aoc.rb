class AOC
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
    digits = line.gsub!(/\D/, '').chars.map(&:to_i)
    digits[0] * 10 + digits[-1]
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
