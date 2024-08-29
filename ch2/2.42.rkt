#lang sicp
; stable function
(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval m n)
  (if (> m n) nil (cons m (enumerate-interval (+ m 1) n))))

(define (filter predicate sequence)
  (cond
    [(null? sequence) nil]
    [(predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence)))]
    [else (filter predicate (cdr sequence))]))
; stable function end.

(define empty-board (list 0))

(define (safe? k positions)
  (define x (car positions))
  (define (iter x-pos current-col pos)
    (cond
      [(null? pos) true]
      [(= x-pos (car pos)) false]
      [(= (+ x-pos current-col) (car pos)) false]
      [(= (- x-pos current-col) (car pos)) false]
      [else (iter x-pos (+ current-col 1) (cdr pos))]))
  (iter x 1 (cdr positions)))

; (safe? (list 1 3 1 7))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

; (flatmap (lambda (new-row) (adjoin-position new-row 0 (list (list 1 2 3 4) (list 5 6 7 8))))
;          (enumerate-interval 1 5))

; (define (queen board-size)
;   (define (queen-cols k)
;     (if (= k 0)
;         (list empty-board)
;         (filter (lambda (positions) (safe? k positions))
;                 (flatmap (lambda (rest-of-queens)
;                            (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
;                                 (enumerate-interval 1 board-size)))
;                          (queen-cols (- k 1))))))
;   (queen-cols board-size))

; (queen 4)

(define (my-queen board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list nil)
        (filter (lambda (x) (safe? 0 x))
                (flatmap (lambda (one-possible)
                           (map (lambda (y) (cons y one-possible))
                                    (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))
; 自己设计的每一层抽象一定要知道输入输出已经对应的操作！
(accumulate (lambda (x y) (+ y 1)) 0 (my-queen 8))

