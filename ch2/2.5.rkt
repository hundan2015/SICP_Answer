#lang sicp
(define (cons a b)
  	 (* (expt 2 a) (expt 3 b)))
(define (iter a b) (
                    if (= 0 (remainder a b))
                       	(+ 1 (iter (/ a b) b))
                        0)
  	)
(define (car a) (iter a 2))
(define (cdr a) (iter a 3))

(car (cons 20 3))
(cdr (cons 2 3))