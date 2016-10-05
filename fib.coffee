class Fib
  # Recursive
  @fib = (n) ->
    if n <= 2
      return 1
    else
      return @fib(n-1) + @fib(n-2)

  # Recursive/Memoized
  @fib_mem = (n, memory={}) ->
    if n<=2
      return 1
    else if memory[n]
      return memory[n]
    else
      memory[n] = @fib_mem(n-1, memory) + @fib_mem(n-2, memory)
      return memory[n]

  # Tail recurssive
  @fib_tail = (n, prev = 1, curr = 1) ->
    return prev if n == 1
    return curr if n == 2
    return @fib_tail(n-1, curr, prev+curr)

  # Iterative
  @fib_itr = (n) ->
    prev =1
    curr =1
    curr_fib = 2

    while curr_fib < n
      temp = curr
      curr = curr+prev
      prev = temp
      curr_fib++

    return curr

console.time("Recursive")
console.log(Fib.fib(10000))
console.timeEnd("Recursive")

console.time("Memoized")
console.log(Fib.fib_mem(10000))
console.timeEnd("Memoized")

console.time("Tail")
console.log(Fib.fib_tail(10000))
console.timeEnd("Tail")

console.time("Iterative")
console.log(Fib.fib_itr(10000))
console.timeEnd("Iterative")
