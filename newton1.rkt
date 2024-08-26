#lang sicp
(define (good-enough guess x)
  (< (abs (- (* (* guess guess) guess) x)) 0.01))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (sqrt-iter guess x)
  (if (good-enough guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (mysqrt x) (sqrt-iter 1.0 x))
(mysqrt 8)