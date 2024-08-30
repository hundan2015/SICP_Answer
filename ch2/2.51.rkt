#lang sicp
(#%require sicp-pict)

(define (my-below painter1 painter2)
  (define split-point (make-vect 0.0 0.5))
  (let ([paint-down (transform-painter painter1 (make-vect 0.0 0.0) (make-vect 1.0 0.0) split-point)]
        [paint-up (transform-painter painter2 split-point (make-vect 1.0 0.5) (make-vect 0.0 1.0))])
    (lambda (frame)
      (paint-up frame)
      (paint-down frame))))

(paint (my-below einstein einstein))

(define (my-flip-horiz painter)
  (transform-painter painter (make-vect 1.0 0.0) (make-vect 0.0 0.0) (make-vect 1.0 1.0)))

(paint (my-flip-horiz einstein))

(define (my-rotate-180 painter)
  (transform-painter painter (make-vect 1.0 1.0) (make-vect 0.0 1.0) (make-vect 1.0 0.0)))
(paint (my-rotate-180 einstein))
(define (my-rotate-270 painter)
  (transform-painter painter (make-vect 0.0 1.0) (make-vect 0.0 0.0) (make-vect 1.0 1.0)))
(paint (my-rotate-270 einstein))

(define (below2 painter1 painter2)
  (my-rotate-180 (my-rotate-270 (beside (my-rotate-270 painter1) (my-rotate-270 painter2)))))

(paint (below2 gray einstein))
