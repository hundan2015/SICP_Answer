#lang sicp
(define (square x)
  (* x x))
(define (pow-iter res now n)
  (cond
    [(= n 0) res]
    [(= (remainder n 2) 0) (pow-iter res (square now) (/ n 2))]
    [else (pow-iter (* res now) (square now) (/ (- n 1) 2))]))
(define (pow b n)
  (pow-iter 1 b n))
(pow 2 4)
(pow 3 3)
(pow 4 3)
; haohaotuidao