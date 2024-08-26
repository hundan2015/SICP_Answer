#lang sicp
(define (square x) (* x x))
(define (expr-iter n now a b)
  (cond ((= n 0) a)
        ((= 2 (remainder n 2))
         (expr-iter (/ n 2) (* now 2) a (square b)))
        (else (expr-iter (- n now) now (* a b) b))
        )
  )

(define (expr-shit b n) (expr-iter n 1 1 b))
(expr-shit 2 10)
(expr-shit 3 4)
