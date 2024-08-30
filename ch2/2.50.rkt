#lang sicp
(#%require sicp-pict)

(define (my-flip-horiz painter)
  (transform-painter painter (make-vect 1.0 0.0) (make-vect 0.0 0.0) (make-vect 1.0 1.0)))

(paint (my-flip-horiz einstein))

(define (my-rotate-180 painter)
  (transform-painter painter (make-vect 1.0 1.0) (make-vect 0.0 1.0) (make-vect 1.0 0.0)))
(paint (my-rotate-180 einstein))
(define (my-rotate-270 painter)
  (transform-painter painter (make-vect 0.0 1.0) (make-vect 0.0 0.0) (make-vect 1.0 1.0)))
(paint (my-rotate-270 einstein))
