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
      filename = './input.test'

      expect(AOC.new(filename)).must_respond_to :run
    end

    it 'should return 35' do
      io = File.open './input.test'

      expect(AOC.new(io).run).must_equal 35
    end

    it 'sould return 313045984' do
      io = File.open '../../input'

      expect(AOC.new(io).run).must_equal 313_045_984
    end
  end
end
