# encoding: utf-8
require "minitest/autorun"
require_relative "stat"

## Tests for Stat class
class TestStat < Minitest::Test
  ## Tests the basic functionality
  def test_basic
    stat = Stat.new("My Stat", 100)
    assert_equal("My Stat", stat.name, "Returns the correct name")
    assert_equal(100, stat.value, "Returns the correct value")
    assert_equal("STATISTIC: My Stat: 100", stat.to_s, "Returns correct representation as a string (to_s())")
  end
end
