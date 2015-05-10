# encoding: utf-8

## General assertion methods

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
