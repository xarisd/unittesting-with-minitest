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
