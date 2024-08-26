#lang sicp
(define (reverse x)
  (define (iter last current)
    (if (null? (cdr current))
        (cons (car current) last)
        (iter (cons (car current) last) (cdr current))))
  (iter nil x))

(reverse (list 1 2 3 4))
; 有点难
