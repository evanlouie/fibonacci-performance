require "big"

module Fib
  # The most readable solution! thats slow and causes stack overflows...
  def fib(n : Int32) : BigInt
    if n <= 2
      return BigInt.new(1)
    else
      return fib(n - 1) + fib(n - 2)
    end
  end

  # That fastest readable solution! that still causes stack overflows...
  def fib_mem(n : Int32, memory = Hash(Int32, BigInt).new) : BigInt
    if n <= 2
      return BigInt.new(1)
    elsif memory[n]?
      return memory[n]
    else
      memory[n] = fib_mem(n - 1, memory) + fib_mem(n - 2, memory)
      return memory[n]
    end
  end

  # Tail recursive! Just as fast as memoizing! But still stack overflows... ruby doesn't TCO :(
  def fib_tail(n : Int32, prev = BigInt.new(1), curr = BigInt.new(1)) : BigInt
    return prev if n == 1
    return curr if n == 2

    fib_tail(n - 1, curr, prev + curr)
  end

  # The ultimate solution!
  def fib_itr(n : Int32) : BigInt
    curr = BigInt.new(1)
    prev = BigInt.new(1)
    # curr and prev already seeded at 1, 1. so current fib is 2
    current_fib = 2

    while current_fib < n
      # hold curr so its not forgotten
      temp = curr

      # by definition, fib is sum of the two prev
      curr += prev

      # prev gets the old curr
      prev = temp

      # current_fib = current_fib + 1
      current_fib += 1
    end

    curr
  end
end

include Fib

time = Time.now
puts fib(40)
puts "Recursive: #{Time.now - time}"

time = Time.now
puts fib_mem(40)
puts "Memoized: #{Time.now - time}"

time = Time.now
puts fib_tail(40)
puts "Tail Recursive: #{Time.now - time}"

time = Time.now
puts fib_itr(40)
puts "Iterative: #{Time.now - time}"
