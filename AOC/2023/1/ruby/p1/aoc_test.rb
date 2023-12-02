#!/usr/bin/env ruby

require 'minitest/autorun'
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

    describe 'return' do
      it 'should be 142' do
        text = %w[
          1abc2
          pqr3stu8vwx
          a1b2c3d4e5f
          treb7uchet
        ].join "\n"
        expect(AOC.new(text).run).must_equal 142
      end

      it 'should be 69' do
        text = %w[
          1abc2defg4
          qwerty5
        ].join "\n"

        expect(AOC.new(text).run).must_equal 69
      end

      it 'should be 420' do
        text = %w[
          aas69
          fdg52
          fsf12sdd6ydsf2
          lfkj4
          4sdsdijf3
          sd3kl
          fjdkhsgfjh6aj7d
          5dfg5a
          gd4kdfjsglkj5
        ].join "\n"
        expect(AOC.new(text).run).must_equal 420
      end

      it 'should be 22' do
        expect(AOC.new('d2fg6df2hj').run).must_equal 22
      end
    end
  end
end
