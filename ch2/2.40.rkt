#lang sicp
(define (enumerate-interval m n)
  (if (> m n) nil (cons m (enumerate-interval (+ m 1) n))))
(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

; (enumerate-interval 1 10)
(define (unique-pairs n)
  (accumulate append
              nil
              (map (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1))))
                   (enumerate-interval 2 n))))
; (unique-pairs 3)
; prime part
(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (next x)
  (if (= x 2) 3 (+ x 2)))

(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (next test-divisor))]))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum? pair)
  (let ([x (car pair)] [y (cadr pair)]) (prime? (+ y x))))

(define (prime-sum-pairs n)
  (accumulate (lambda (x y) (if (prime-sum? x) (append (list x) y) y)) nil (unique-pairs n)))

(prime-sum-pairs 5)
