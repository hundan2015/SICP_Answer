#lang sicp
(define (make-rat n d)
  (define g  (gcd (abs n) (abs d)))
  (let ((n1 (/ n g))
        (d1 (/ d g)))
    (if (> (* n d) 0)
        (cons (abs n1) (abs d1))
        (cons (- (abs n1)) (abs d1))
        )))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 6 -2))