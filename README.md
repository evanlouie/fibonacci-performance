# Language Performance Calculating The Nth Fibonacci

One of the most common interview questions also happens to be a good measure of performance for differing languages.

With a whole bunch of different ways to implement it, calculating the nth Fibonacci number can both reveal strengths/weaknesses of languages as optimizations become easier or more difficult (possibly impossible) to implement.

## Calculating the 42nd Fibonacci number

Language         | Style              | Time (seconds unless explicitly noted)
---------------- | ------------------ | --------------------------------------
Ruby (2.3.1p112) | Recursive          | 12.163913
                 | Recursive/Memoized | 00.000063
                 | Tail Recursive     | 00.000014
                 | Iterative          | 00.000015
Crystal (0.19.3) | Recursive          | 20.0241730
                 | Recursive/Memoized | 00.0000270
                 | Tail Recursive     | 00.0000140
                 | Iterative          | 00.0000120
Node (6.7.0)     | Recursive          | 00.976164
                 | Recursive/Memoized | 00.000408
                 | Tail Recursive     | 00.000221
                 | Iterative          | 00.000162
Go (1.7.1)       | Recursive          | 81.471789461
                 | Recursive/Memoized | 00.00002876
                 | Tail Recursive     | 00.000007418
                 | Iterative          | 00.000007196

# Takeaways

I was extremely surprised by the findings of this basic test. I of course expected Ruby to be the slowest and in general, it was. However I was not expecting the implementation of BigInt in Crystal and Go to be so expensive. More specifically in the recursive solution to them. I tried implement the algorithm as closely as possible for all languages. As such, I did not do implement any sort of variadic functions for Int32, Int64, and BigInt, and just chose to default to BigInt as the dynamic languages did not require such implementation.

I was amazed at the performance optimizations Ruby has done in terms of autoscaling its number type. Without actually doing any explicit typing, Ruby's number type management is optimized enough to stay competitive with Crystal and to Go.

# Caveats

This is an EXTREMELY dumb performance test. Meaning that I only really wanted to see how the languages would perform when I tried to transfer the same code from language to language without any sort of optimizations. Because of this, I default to the BigInt type for Go and Crystal. A test using variadic functions to optimize between Int32/Int64/BigInt would most definitely make Go and Crystal leagues faster. I also wouldn't be surprised if this performance measure changed drastically as Go and Crystal optimize there BigInt implementations.
