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

(define (tan-df x k) (/ (- 
                         (cont-frac (lambda (n) (- (* 2.0 n) 1)) 
                                    (lambda (n) (- (* x x)))
                                        k)
                         ) x))
(tan-df (/ 3.1415926 4) 10000)