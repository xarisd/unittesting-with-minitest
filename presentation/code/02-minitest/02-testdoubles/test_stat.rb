# encoding: utf-8
require "minitest/autorun"
require_relative "stat_custom_printer"

## Tests for StatCustomPrinter class
class TestStatCustomPrinter < Minitest::Test
  ## Tests that the :name and :value gets called
  def test_uses_name_and_value
    stat_printer = StatCustomPrinter.new

    # prepare the mock
    stat = Minitest::Mock.new
    stat.expect :name, :return_value
    stat.expect :value, :return_value

    # call the method under test
    stat_printer.print(stat)

    # verify that the mock's methods have been called
    stat.verify
  end

  ## Tests the output of the method
  def test_returns_correct_output_minitest
    stat_printer = StatCustomPrinter.new

    # stubbing the Ruby way ... OK
    stat = Object.new
    def stat.name
      "My Stat"
    end
    def stat.value
      100
    end

    # Stub out Time.now() ONLY for the duration of the block
    Time.stub(:now, Time.mktime(2015, 05, 11)) do
      assert_equal("Date : 11/05/2015\nName: My Stat\nvalue:100",
                   stat_printer.print(stat))
    end
  end
end
