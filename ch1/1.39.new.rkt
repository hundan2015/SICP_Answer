#lang sicp
(define (tan-cf-tree x k)
  (let ((x-state (* x x)))
    (define (tree counter)
      (if (= k counter)
          1
          (- (- (* 2 counter) 1) (/ x-state (tree (+ 1 counter))))))
    (/ x (tree 1) ))
  )

(tan-cf-tree 3.14159 1000)
(tan 3.14159)

(define (tan-cf-iter x k)
  (let ((square (* x x)))
    (define (iter last counter)
      (if (= counter 0)
          (/ x last)
          (iter (- (* 2 counter) 1 (/ square last)) (- counter 1))))
    (iter 1 k)))
(tan-cf-iter 3.14159 1000)