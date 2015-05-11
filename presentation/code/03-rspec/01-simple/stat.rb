# encoding: utf-8

## A class that represents statistics
class Stat
  attr_reader :name, :value

  def initialize(name="GIVE ME A NAME", value=0)
    @name = name
    @value = value
  end

  def to_s
    "STATISTIC: #{name}: #{value}"
  end
end
