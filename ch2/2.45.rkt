#lang sicp
(#%require sicp-pict)
; (define (square-of-four tl tr bl br)
;   (lambda (painter)
;     (let ([top (beside (tl painter) (tr painter))] [bottom (beside (bl painter) (br painter))])
;       (below bottom top))))

; (define (flipped-pairs painter)
;   (let ((combine4 (square-of-four identity flip-vert identity flip-vert)))
;     (combine4 painter)))

; (paint (flipped-pairs einstein))

(define (split bigger smaller)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ([small ((split bigger smaller) painter (- n 1))])
          (bigger painter (smaller small small))))))

(define right-split (split beside below))

(paint (right-split einstein 4))
