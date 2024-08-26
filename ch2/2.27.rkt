#lang sicp
(define (deep-reverse x)
  (define (iter last current)
    (cond
      [(not (pair? current)) current]
      [(null? (cdr current)) (cons (iter nil (car current)) last)]
      [else (iter (cons (iter nil (car current)) last) (cdr current))]))
  (iter nil x))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)
