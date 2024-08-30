#lang sicp
(#%require sicp-pict)

(define (wave frame)
  (define a ((frame-coord-map frame) (make-vect 0 0)))
  (define b ((frame-coord-map frame) (make-vect 0 1)))
  (define c ((frame-coord-map frame) (make-vect 1 1)))
  (define d ((frame-coord-map frame) (make-vect 1 0)))
  (segments->painter
   (list (make-segment a b) (make-segment b c) (make-segment c d) (make-segment d a))))

(define (new-wave frame)
  (define a ((frame-coord-map frame) (make-vect 0 0.5)))
  (define b ((frame-coord-map frame) (make-vect 0.5 1)))
  (define c ((frame-coord-map frame) (make-vect 1 0.5)))
  (define d ((frame-coord-map frame) (make-vect 0.5 0)))
  (segments->painter (list (make-segment a b)
                           (make-segment b c)
                           (make-segment c d)
                           (make-segment d a)
                           (make-segment a c)
                           (make-segment b d))))

(define frame-a (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))
(paint (new-wave frame-a))

(define (split bigger smaller)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ([small ((split bigger smaller) painter (- n 1))])
          (bigger painter (smaller small small))))))

(define right-split (split beside below))
(define up-split (split below beside))
; (2) Wtf
