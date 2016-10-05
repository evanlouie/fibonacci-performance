<?php

function fib($n) {
  if ($n <= 2) {
    return 1;
  } else {
    return fib($n-1) + fib($n-2);
  }
}

function fibMem($n, $memory = []) {
  if ($n <= 2) {
    return 1;
  } else if (!is_null($memory[$n])) {
    return $memory[$n];
  } else {
    $memory[$n] = fibMem($n-1, $memory) + fibMem($n-2, $memory);
    return $memory[$n];
  }
}

function fibTail($n, $prev = 1, $curr = 1) {
  
}
