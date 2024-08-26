#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init segs)
  (if (null? (car segs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) segs))
            (accumulate-n op init (map (lambda (x) (cdr x)) segs)))))

; 思路：
; 1. 看到cons，肯定是按位算的，也就是说n代表着第几位
; 2. (null? (car segs))说明是按照横排算的，再加上这个递进的感觉
; 3. 联想到map，如果是横着递归向下的话，对于当前层累加的是segs的car，下一层是cdr

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 s)
