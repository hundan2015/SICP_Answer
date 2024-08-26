#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
              0
              (map (lambda (x)
                     (cond
                       [(null? x) 0]
                       [(pair? x) (+ (count-leaves (car x)) (count-leaves (cdr x)))]
                       [else 1]))
                   (if (pair? t) t (list t)))))
; 思想就是使用map将树转换成一个序列，对于序列上的每个元素当作一个子树，递归求子树叶子节点个数，将子树
; 序列map成子树叶子节点个数序列。对于其中需要处理的是叶子节点是单独的数，需要用pair?转换一下，把叶子节点看成单独的序列。
(count-leaves (list (list 1 2) (list (list 3 4 6) 5)))
