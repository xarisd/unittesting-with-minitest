# encoding: utf-8
require "minitest/autorun"
require_relative "stat_custom_printer"

## Tests for StatCustomPrinter class
class TestStatCustomPrinterMock < Minitest::Test
  ## Tests that the :name and :value gets called
  #  this is an example of mocking
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
end
