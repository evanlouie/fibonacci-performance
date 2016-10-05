module Fib
    # The most readable solution! thats slow and causes stack overflows...
    def fib(n)
        if n <= 2
            return 1
        else
            return fib(n - 1) + fib(n - 2)
        end
    end

    # That fastest readable solution! that still causes stack overflows...
    def fib_mem(n, memory = {})
        if n <= 2
            return 1
        elsif memory[n]
            return memory[n]
        else
            memory[n] = fib_mem(n - 1, memory) + fib_mem(n - 2, memory)
            return memory[n]
        end
    end

    # Tail recursive! Just as fast as memoizing! But still stack overflows... ruby doesn't TCO :(
    def fib_tail(n, prev = 1, curr = 1)
        return prev if n == 1
        return curr if n == 2

        fib_tail(n - 1, curr, prev + curr)
    end

    # The ultimate solution!
    def fib_itr(n)
        curr = 1
        prev = 1
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
puts fib_tail(1000)
puts Time.now - time
