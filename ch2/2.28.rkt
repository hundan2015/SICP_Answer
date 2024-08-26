#lang sicp
(define (fringe x)
  (cond
    [(not (pair? x)) (list x)]
    [(null? (cdr x)) (fringe (car x))]
    [else (append (fringe (car x)) (fringe (cdr x)))]))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
