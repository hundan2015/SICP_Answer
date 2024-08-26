#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-new term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))

(define (front-num x n)
  (cond ((= x 0) 1)
        ((= x n) 1)
        ((= (remainder x 2) 0) 2)
        (else 4)))

(define (jifen term a b n)
  (define h (/ (- b a) n))
  ( * (/ h 3)  (sum-new
                (lambda (i) (* (term (+ a (* i h))) (front-num i n)))
                0
                (lambda (a) (+ a 1))
                n))
  )
(jifen cube 0 1 100)