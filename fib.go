package main

import (
	"fmt"
	"math/big"
	"time"
)

func main() {
	start := time.Now()
	fmt.Println(fibItr(1000000))
	elapsed := time.Since(start)
	fmt.Println(fmt.Sprintf("Time: %s", elapsed))
}

func fib(n int) *big.Int {
	if n <= 2 {
		return big.NewInt(1)
	} else {
		return big.NewInt(0).Add(fib(n-1), fib(n-2))
	}
}

func fibMem(n int, memory map[int]*big.Int) *big.Int {
	if n <= 2 {
		return big.NewInt(1)
	} else if answer, ok := memory[n]; ok {
		return answer
	} else {
		memory[n] = big.NewInt(0).Add(fibMem(n-1, memory), fibMem(n-2, memory))
		return memory[n]
	}
}

func fibTail(n int, prev, curr *big.Int) *big.Int {
	if n == 1 {
		return prev
	} else if n == 2 {
		return curr
	} else {
		return fibTail(n-1, curr, big.NewInt(0).Add(prev, curr))
	}
}

func fibItr(n int) *big.Int {
	prev := big.NewInt(1)
	curr := big.NewInt(1)
	currentFib := 2

	for currentFib < n {
		temp := curr
		curr = big.NewInt(0).Add(prev, curr)
		prev = temp
		currentFib++
	}

	return curr
}
