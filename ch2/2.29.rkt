#lang sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (left-branch x)
  (car x))
(define (right-branch x)
  (car (cdr x)))
(define (branch-length x)
  (car x))
(define (branch-structure x)
  (car (cdr x))) ;必须注意list的性质！对于右边的元素应该特殊处理！

(define (total-weight x)
  (define (get-branch-weight branch)
    (define structure (branch-structure branch))
    (if (pair? structure) (total-weight structure) structure))
  (cond
    [(null? x) 0]
    [else (+ (get-branch-weight (left-branch x)) (get-branch-weight (right-branch x)))]))

(define (check-balence x)
  (define (check-branch-balence branch)
    (define (weight)
      (define structure (branch-structure branch))
      (if (pair? structure) (check-balence structure) structure))
    (if (= (weight) -1) -1 (weight)))
  (if (null? x)
      1
      (let ([left-weight (check-branch-balence (left-branch x))]
            [right-weight (check-branch-balence (right-branch x))]
            [left-length (branch-length (left-branch x))]
            [right-length (branch-length (right-branch x))])
        (cond
          [(or (= left-weight -1) (= right-weight -1)) -1]
          [(= (* left-weight left-length) (* right-weight right-length)) (+ left-weight right-weight)]
          [else -1]))))


(define x
  (make-mobile (make-branch 1 (make-mobile (make-branch 1 2) (make-branch 1 2))) (make-branch 3 4)))
(define y
  (make-mobile (make-branch 6 2) (make-branch 3 4)))
(total-weight x)

(check-balence y)
