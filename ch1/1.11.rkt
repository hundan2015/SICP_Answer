#lang sicp
(define (f-iter product n1 n2 n3 counter n)
  (if ( = counter n)
      product
      (f-iter (+ n1 (* 2 n2) (* 3 n3))
              product
              n1
              n2
              (+ counter 1)
              n)))

(define (f x) (f-iter 14 3 2 1 3 x))

(f 4)