#lang sicp
(define (cont-frac d n k)
  (define (iter d n k counter)
    (if (> counter k)
        0
        (/ (n counter) (+ (d counter) (iter d n k (+ counter 1)))))
    )
  (iter d n k 1))

(define (cont-frac-iter d n k)
  (define (iter d n k result)
    (if (= k 0)
        result
        (iter d n (- k 1) (/ (n k) (+ (d k) result))))
    )
  (iter d n k 0))

(+ 2 (cont-frac (lambda (n) (if (= 2 (remainder n 3))
                               (* 2 (ceiling (/ n 3)))
                               1))
               (lambda (n) 1.0)
               100
               ))
