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
      it 'should be 281' do
        text = %w[
          two1nine
          eightwothree
          abcone2threexyz
          xtwone3four
          4nineeightseven2
          zoneight234
          7pqrstsixteen
        ].join "\n"
        expect(AOC.new(text).run).must_equal 281
      end

      it 'should be 69' do
        text = %w[
          four5adfk23
          dd2dffoursix
        ].join "\n"

        expect(AOC.new(text).run).must_equal 69
      end

      it 'should be 21' do
        expect(AOC.new('twone').run).must_equal 21
      end

      it 'should be 18' do
        expect(AOC.new('oneight').run).must_equal 18
      end
    end
  end
end
