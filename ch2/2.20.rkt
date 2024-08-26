#lang sicp
(define (same-parity x . y)
  (define mod (remainder x 2))
  (define (iter current)
    (cond
      [(null? current) current]
      [(= mod (remainder (car current) 2)) (cons (car current) (iter (cdr current)))]
      [else (iter (cdr current))]))
  (iter y))

(same-parity 1 2 3 4 5)
