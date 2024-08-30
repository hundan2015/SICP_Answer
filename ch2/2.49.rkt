#lang sicp
(#%require sicp-pict)

(define (draw-frame frame)
  (define a ((frame-coord-map frame) (make-vect 0 0)))
  (define b ((frame-coord-map frame) (make-vect 0 1)))
  (define c ((frame-coord-map frame) (make-vect 1 1)))
  (define d ((frame-coord-map frame) (make-vect 1 0)))
  (segments->painter
   (list (make-segment a b) (make-segment b c) (make-segment c d) (make-segment d a))))
(define (draw-frame-x frame)
  (define a ((frame-coord-map frame) (make-vect 0 0)))
  (define b ((frame-coord-map frame) (make-vect 0 1)))
  (define c ((frame-coord-map frame) (make-vect 1 1)))
  (define d ((frame-coord-map frame) (make-vect 1 0)))
  (segments->painter (list (make-segment a c) (make-segment b d))))
(define (draw-frame-mid frame)
  (define a ((frame-coord-map frame) (make-vect 0 0.5)))
  (define b ((frame-coord-map frame) (make-vect 0.5 1)))
  (define c ((frame-coord-map frame) (make-vect 1 0.5)))
  (define d ((frame-coord-map frame) (make-vect 0.5 0)))
  (segments->painter
   (list (make-segment a b) (make-segment b c) (make-segment c d) (make-segment d a))))

(define frame-a (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))
(paint (draw-frame frame-a))
(paint (draw-frame-x frame-a))
(paint (draw-frame-mid frame-a))
