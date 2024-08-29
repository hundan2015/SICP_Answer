#lang sicp

(define (enumerate-interval m n)
  (if (> m n) nil (cons m (enumerate-interval (+ m 1) n))))
(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (unique-pairs n)
  (accumulate append
              nil
              (map (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1))))
                   (enumerate-interval 2 n))))

; (define (make-tri-turple n)
;   (accumulate append nil (map (lambda (x)) (unique-pairs x) (enumerate-interval 1 n))))
(define (make-tri-turple n)
  (accumulate append
              nil
              (map (lambda (x) (map (lambda (y) (cons x y)) (unique-pairs (- x 1))))
                   (enumerate-interval 2 n))))
;(make-tri-turple 5)
(define (is-sum-s? pair s)
  (= s (accumulate + 0 pair)))

(define (func n s)
  (accumulate (lambda (a y) (if (is-sum-s? a s) (cons a y) y)) nil (make-tri-turple n)))

(func 10 12)
