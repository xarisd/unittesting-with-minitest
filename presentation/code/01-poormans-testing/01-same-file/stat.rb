# encoding: utf-8

## A class that represents statistics
class Stat
  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "STATISTIC: #{name}: #{value}"
  end
end

# Tests...
# see http://ruby-doc.org/docs/ruby-doc-bundle/Manual/man-1.4/variable.html#zero
if __FILE__ == $0
  def assert(condition, message)
    if condition
      puts "."
    else
      puts "FAIL : #{message}"
    end
  end

  def assert_equal(expected, actual, message)
    condition = (expected == actual)
    unless condition
      message = "#{message} \t expected:\t'#{expected}' \t actual:\t'#{actual}'"
    end
    assert(condition, message)
  end

  def tests
    stat = Stat.new("My Stat", 100)
    assert("My Stat" == stat.name, "Returns the correct name")
    assert(100 == stat.value, "Returns the correct value")
    assert("STATISTIC: My Stat: 100" == stat.to_s, "Returns correct representation as a string (to_s())")
  end

  def more_tests
    stat = Stat.new("My Stat", 100)
    assert_equal("My Stat", stat.name, "Returns the correct name")
    assert_equal(100, stat.value, "Returns the correct value")
    assert_equal("STATISTIC: My Stat: 100", stat.to_s, "Returns correct representation as a string (to_s())")
  end

  tests
  more_tests

end
