# encoding: utf-8
require "minitest/autorun"
require_relative "stat"

## Tests for Stat class
class TestStat < Minitest::Test
  def test_name
    stat = Stat.new("My Stat", 100)
    assert_equal "My Stat", stat.name
  end

  def test_value
    stat = Stat.new("My Stat", 100)
    assert_equal 100, stat.value
  end

  def test_to_s
    stat = Stat.new("My Stat", 100)
    assert_equal "STATISTIC: My Stat: 100", stat.to_s
  end
end
