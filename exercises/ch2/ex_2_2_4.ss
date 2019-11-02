; (car (car '((a b) (c d)))) yields a. Determine which compositions of car and cdr applied to ((a b) (c d)) yield b, c, and d.
;(car (car '((a b) (c d))))
; b
(car (cdr (car  '((a b) (c d)))))

; c
(car (car (cdr '((a b) (c d)))))

; d
(car (cdr (car  (cdr '((a b) (c d))))))