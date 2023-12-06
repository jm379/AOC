require 'stringio'

class AOC
  def initialize(str)
    @io = StringIO.new str
  end

  def run
    sum = 0
    lines do |pline, cline, nline|
      cline.each_char.with_index do |chr, idx|
        next unless star?(chr)

        numbers = gears_nearby(pline, cline, nline, idx)
        sum += numbers.reduce(:*) if numbers.size > 1
      end
    end
    sum
  end

  private

  def lines
    pline = nil
    cline = nil
    nline = @io.gets chomp: true
    loop do
      pline = cline
      cline = nline
      nline = @io.gets chomp: true
      break unless cline

      yield pline, cline, nline
    end
  end

  def digit?(chr)
    ('0'..'9').include?(chr)
  end

  def star?(chr)
    chr == '*'
  end

  def gears_nearby(pline, cline, nline, idx)
    [pline, cline, nline].reduce([]) do |memo, line|
      memo << gears(line, idx)
    end.flatten!.compact!
  end

  def gears(line, idx)
    return [] unless line

    gears = (-1..1).inject([]) do |memo, offset|
      memo << gear(line, idx + offset)
    end

    remove_dup gears
  end

  def remove_dup(gears)
    gears unless gears[1]
    gears = [gears[0]] if gears[0] == gears[1] && gears[1] == gears[2]
    gears.delete_at(1) if gears[0] == gears[1]
    gears.delete_at(1) if gears[2] == gears[1]

    gears
  end

  def gear(line, idx)
    return if idx.negative?

    numbers = line[idx]
    return unless digit?(numbers)

    (1..2).each do |offset|
      next if (idx - offset).negative?

      chr = line[idx - offset]
      break unless digit?(chr)

      numbers.prepend chr
    end
    (1..2).each do |offset|
      chr = line[idx + offset]
      break unless digit?(chr)

      numbers << chr
    end
    numbers.to_i
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
