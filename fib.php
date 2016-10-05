<?php

function fib($n)
{
    if ($n <= 2) {
        return 1;
    } else {
        return fib($n - 1) + fib($n - 2);
    }
}

function fibMem($n, &$memory = [])
{
    if ($n <= 2) {
        return 1;
    } elseif (array_key_exists($n, $memory)) {
        return $memory[$n];
    } else {
        $memory[$n] = fibMem($n - 1, $memory) + fibMem($n - 2, $memory);

        return $memory[$n];
    }
}

function fibTail($n, $prev = 1, $curr = 1)
{
    if ($n == 1) {
        return $prev;
    } elseif ($n == 2) {
        return $curr;
    } else {
        return fibTail($n - 2, $curr, $prev + $curr);
    }
}

function fibItr($n)
{
    $prev = 1;
    $curr = 1;
    $currFib = 2;

    while ($currFib < $n) {
        $temp = $curr;
        $curr = $curr + $prev;
        $prev = $temp;
        ++$currFib;
    }

    return $curr;
}

$start = microtime(true);
echo fib(10000);
$end = microtime(true);
$time = $end - $start;
echo PHP_EOL."Recursive: $time".PHP_EOL;

$start = microtime(true);
echo fibMem(10000);
$end = microtime(true);
$time = $end - $start;
echo PHP_EOL."Memoized: $time".PHP_EOL;

$start = microtime(true);
echo fibTail(10000);
$end = microtime(true);
$time = $end - $start;
echo PHP_EOL."Tail Recursive: $time".PHP_EOL;

$start = microtime(true);
echo fibItr(10000);
$end = microtime(true);
$time = $end - $start;
echo PHP_EOL."Iterative: $time".PHP_EOL;
