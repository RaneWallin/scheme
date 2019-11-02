; Write a Scheme expression that evaluates to the following internal list structure.
; diagram: https://scheme.com/tspl4/math/tspl/2.gif

(cons '(a . b) (cons (cons '(c) '(d)) (cons '() '())))
; output: ((a . b) ((c) d) ())