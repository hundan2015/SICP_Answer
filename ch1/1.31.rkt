#lang sicp
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (func x) (/
                  (* 2 (floor (/ (+ x 2) 2)))
                  (+ 1 (* 2 (floor (/ (+ x 1) 2))))))

(- (* 4 (product func 1 (lambda (a) (+ a 1)) 10000)) 3.1415926)