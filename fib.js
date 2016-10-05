var Fib;

Fib = (function() {
  function Fib() {}

  Fib.fib = function(n) {
    if (n <= 2) {
      return 1;
    } else {
      return this.fib(n - 1) + this.fib(n - 2);
    }
  };

  Fib.fib_mem = function(n, memory) {
    if (memory == null) {
      memory = {};
    }
    if (n <= 2) {
      return 1;
    } else if (memory[n]) {
      return memory[n];
    } else {
      memory[n] = this.fib_mem(n - 1, memory) + this.fib_mem(n - 2, memory);
      return memory[n];
    }
  };

  Fib.fib_tail = function(n, prev, curr) {
    if (prev == null) {
      prev = 1;
    }
    if (curr == null) {
      curr = 1;
    }
    if (n === 1) {
      return prev;
    }
    if (n === 2) {
      return curr;
    }
    return this.fib_tail(n - 1, curr, prev + curr);
  };

  Fib.fib_itr = function(n) {
    var curr, curr_fib, prev, temp;
    prev = 1;
    curr = 1;
    curr_fib = 2;
    while (curr_fib < n) {
      temp = curr;
      curr = curr + prev;
      prev = temp;
      curr_fib++;
    }
    return curr;
  };

  return Fib;

})();

console.time("Memoized");
console.log(Fib.fib_mem(10000));
console.timeEnd("Memoized");

console.time("Tail");
console.log(Fib.fib_tail(10000));
console.timeEnd("Tail");

console.time("Iterative");
console.log(Fib.fib_itr(10000));
console.timeEnd("Iterative");
