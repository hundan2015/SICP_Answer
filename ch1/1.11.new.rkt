#lang sicp
(define (get-new x y z)
  (+ x (* 2 y) (* 3 z)))
(define (f-iter x y z n)
  (if (= n 0)
      x
      (f-iter (get-new x y z) x y (- n 1))))
(define (f n)
  (f-iter 2 1 0 (- n 2)))
(f 3)