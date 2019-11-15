; 2.4

; square brackets don't work in Dr. Racket/R5RS

(let ((a 4) (b -3))
    (let ((a-squared (* a a))
          (b-squared (* b b)))
      (+ a-squared b-squared)))
; => 25

(let ((x 1))
  (let ((x (+ x 1))) ; shadow binding/lexical scoping
    (+ x x)))
; => 4

; avoids shadow binding
(let ((x 1))
  (let ((new-x (+ x 1)))
    (+ new-x new-x)))
; => 4

