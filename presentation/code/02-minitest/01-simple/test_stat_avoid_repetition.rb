# encoding: utf-8
require "minitest/autorun"
require_relative "stat"

## Tests for Stat class
class TestStat < Minitest::Unit::TestCase
  def setup
    @stat = Stat.new("My Stat", 100)
    # puts "This runs before every test. Use it for setting up the environment."
  end

  def teardown
    # puts "This runs before every test. Use it for cleaning up."
  end

  def test_name
    assert_equal "My Stat", @stat.name
  end

  def test_value
    assert_equal 100, @stat.value
  end

  def test_to_s
    assert_equal "STATISTIC: My Stat: 100", @stat.to_s
  end
end
