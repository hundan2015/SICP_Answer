#lang sicp

(define (my-equal? a b)
  (cond
    [(and (pair? a) (pair? b)) (and (eq? (car a) (car b)) (my-equal? (cdr a) (cdr b)))]
    [(and (not (pair? a)) (not (pair? b))) (eq? a b)]
    [else false]))

(my-equal? '(this is a list) '(this is a list))
(my-equal? '(this is a list) '(this (is a) list))
