# Language Performance Using Fibonacci

One of the most common interview questions also happens to be a good measure of performance for differing languages.

With a whole bunch of different ways to implement it, calculating the nth Fibonacci number can both reveal strengths/weaknesses of languages as optimizations become easier or more difficult (possibly impossible) to implement.

## Calculating the 42nd Fibonacci number

Language   | Style              | Time (seconds unless explicitly noted)
---------- | ------------------ | --------------------------------------
Ruby       | Recursive          | 12.163913
           | Recursive/Memoized | 9.1e-05
           | Tail Recursive     | 2.1e-05
           | Iterative          | 1.5e-05
Crystal    | Recursive          | 00:00:20.0241730
           | Recursive/Memoized | 00:00:00.0000270
           | Tail Recursive     | 00:00:00.0000140
           | Iterative          | 00:00:00.0000120
JavaScript | Recursive          | 976.164ms
           | Recursive/Memoized | 0.408ms
           | Tail Recursive     | 0.221ms
           | Iterative          | 0.162ms
Go         | Recursive          | 1m21.471789461s
           | Recursive/Memoized | 28.762µs
           | Tail Recursive     | 7.418µs
           | Iterative          | 7.196µs
