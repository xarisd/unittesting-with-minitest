# encoding: utf-8

## A custom printer for Stat like objects
class StatCustomPrinter
  def print(stat)
    date_str = "Date : #{Time.now.strftime('%d/%m/%Y')}"
    "#{date_str}\nName: #{stat.name}\nvalue:#{stat.value}"
  end
end
