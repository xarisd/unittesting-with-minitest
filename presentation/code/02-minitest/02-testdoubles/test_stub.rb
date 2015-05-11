# encoding: utf-8
require "minitest/autorun"
require_relative "stat_custom_printer"

## Tests for StatCustomPrinter class
class TestStatCustomPrinterStub < Minitest::Test
  def setup
    @stat_printer = StatCustomPrinter.new

    # stubbing the Ruby way ... OK
    @stat = Object.new
    def stat.name
      "My Stat"
    end
    def stat.value
      100
    end
  end

  ## Tests the output of the method
  #  this is an example of stubbing class methods the Ruby way ... ANTIPATTERN
  def test_returns_correct_output_antipattern
    # Open Time class and redefine .now()
    def Time.now
      Time.mktime(2015, 05, 10)
    end

    assert_equal("Date : 10/05/2015\nName: My Stat\nvalue:100",
                 @stat_printer.print(@stat))
  end

  ## Tests the output of the method
  #  this is an example of stubbing the Minitest way
  def test_returns_correct_output_minitest
    # Stub out Time.now() ONLY for the duration of the block
    Time.stub(:now, Time.mktime(2015, 05, 11)) do
      assert_equal("Date : 11/05/2015\nName: My Stat\nvalue:100",
                   @stat_printer.print(@stat))
    end
  end
end
