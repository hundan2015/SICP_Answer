#lang sicp
(define (pascal row col)
  (cond ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) col)
                 (pascal (- row 1) (- col 1))))))

(define (col-iter n target)
  (if (> n target)
      (newline)
      (begin
        (display (pascal target n))
        (display " ")
        (col-iter (+ n 1) target)
        )))

(define (row-iter n target)
  (if (> n target)
      (newline)
      (begin
        (col-iter 1 n)
        (row-iter (+ n 1) target))))

(define (show x)
  (row-iter 1 x))

(show 5)