#!/usr/bin/env ruby

require 'minitest/autorun'
require 'stringio'
require_relative 'aoc'

describe AOC do
  describe 'new' do
    it 'should respond to' do
      expect(AOC).must_respond_to :new
    end
  end

  describe 'run' do
    it 'must respond to' do
      expect(AOC.new('')).must_respond_to :run
    end

    it 'should return 4361' do
      text = [
        '467..114..',
        '...*......',
        '..35..633.',
        '......#...',
        '617*......',
        '.....+.58.',
        '..592.....',
        '......755.',
        '...$.*....',
        '.664.598..'
      ].join "\n"

      expect(AOC.new(text).run).must_equal 4361
    end

    it 'should return 413' do
      text = [
        '12.......*..',
        '+.........34',
        '.......-12..',
        '..78........',
        '..*....60...',
        '78..........',
        '.......23...',
        '....90*12...',
        '............',
        '2.2......12.',
        '.*.........*',
        '1.1.......56'
      ].join "\n"

      expect(AOC.new(text).run).must_equal 413
    end

    it 'should return 925' do
      text = [
        '12.......*..',
        '+.........34',
        '.......-12..',
        '..78........',
        '..*....60...',
        '78.........9',
        '.5.....23..$',
        '8...90*12...',
        '............',
        '2.2......12.',
        '.*.........*',
        '1.1..503+.56'
      ].join "\n"

      expect(AOC.new(text).run).must_equal 925
    end
  end
end
