require 'stringio'

class AOC
  def initialize(str)
    @io = StringIO.new str
  end

  def run
    numbers = []
    lines(@io) do |pline, cline, nline|
      add = false
      number = []

      cline.each_char.with_index do |chr, idx|
        if number?(chr)
          number << chr
          add ||= symbol_neaby?(cline, pline, nline, idx)
        end
        number = [] if !add && dot?(chr)

        if add && (!number?(chr) || cline.size - 1 == idx)
          numbers << number.join.to_i
          add = false
          number = []
        end
      end
    end

    numbers.sum
  end

  private

  def lines(io)
    pline = nil
    cline = nil
    nline = io.gets chomp: true
    loop do
      pline = cline
      cline = nline
      nline = io.gets chomp: true
      break unless cline

      yield pline, cline, nline
    end
  end

  def number?(chr)
    ('0'..'9').include? chr
  end

  def symbol?(chr)
    chr && !number?(chr) && !dot?(chr)
  end

  def dot?(chr)
    chr == '.'
  end

  def symbol_neaby?(cline, pline, nline, idx)
    symbol_current_line?(cline, idx) ||
      symbol_previous_line?(pline, idx) ||
      symbol_next_line?(nline, idx)
  end

  def symbol_current_line?(cline, idx)
    return false unless cline

    prev = idx.zero? ? nil : cline[idx - 1]
    symbol?(prev) || symbol?(cline[idx + 1])
  end

  def symbol_previous_line?(pline, idx)
    return false unless pline

    prev = idx.zero? ? nil : pline[idx - 1]
    symbol?(prev) || symbol?(pline[idx]) || symbol?(pline[idx + 1])
  end

  def symbol_next_line?(nline, idx)
    return false unless nline

    prev = idx.zero? ? nil : nline[idx - 1]
    symbol?(prev) || symbol?(nline[idx]) || symbol?(nline[idx + 1])
  end
end

return if ARGV.empty?

p AOC.new(File.read(ARGV.shift)).run
