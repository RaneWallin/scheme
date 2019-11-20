; Rane Wallin

; Accepts two 1 bit integers and returns a single
; 1 bit integer.
; returns 1 is both integers = 1
; returns 0 is either integer or both = 0
(define l-and (lambda (a b)
                (cond ( (= (+ a b) 2) 1)
                      (else 0)
                )
              )
)

; Accepts two 1-bit integers and returns a single
; 1-bit integer
; returns 1 if either integer is 1
; returns 0 if both integers are 0
(define l-or (lambda (a b)
               (cond ( (> (+ a b) 0)  1)
                     (else 0)
                     )
               )
  )

; Accepts one 1-bit integer and returns a 1-bit integer
; returns 1 if intenger is 1
; returns 0 if integer is 0
(define l-not (lambda (a)
                (cond ((= a 0) 1)
                      (else 0)
                )
  ))

; Accepts two 1-bit integers and returns one 1-bit int
; returns 1 of either int is 1 but not both
; returns 0 if neither int is 1 or both are
(define l-xor (lambda (a b)
                (cond ( (= (+ a b) 1)  1)
                      (else 0)
                )
  ))

; takes in three 1-bit integers and returns a pair of 1-bit integers
; Useage: (fulladder x a b) where x is the carry
; output (s c) where s is the sum and c is the carry
(define fulladdr (lambda (x a b)
                    (cons (l-xor (l-xor a b) x)
                          (l-or (l-and a b) (l-and (l-xor a b) x))
                           
                          )
                    )
  )

; Accepts a list to reverse and an empty list
(define do-reverse (lambda (l nl)
                       (cond ((= (length l) 0) nl)
                             (else (do-reverse (cdr l) (cons (car l) nl))
                                   )
                             )
                       )
)

; Accepts a list to reverse and reverses using the
; do-reverse helper function
; output list
(define reverse-list (lambda (l)
                       (cond ((= (length l) 0) l)
                             (else (do-reverse (cdr l) (cons (car l) '())))
                             )
                       )
)

; Accepts two lists and a 1-bit carry digit and returns a pair containing a list
; and a carry digit. Uses a helper function to add a pair of binary lists
; output: ((# # #) . #)
(define n-bit-addr (lambda (a b c)
                      (do-adder
                       (reverse-list a) ; a
                       (reverse-list b) ; b
                       c                ; c
                       '()              ; nl
                       )
                      )
  )

; Accepts three lists and a carry digit.
; output ((# # #) . #)
(define do-adder (lambda (a b c nl)
                   (cond ((= (length a) 0) (cons nl c))
                   (else (do-adder
                          (cdr a)                                       ; a
                          (cdr b)                                       ; b
                          (cdr (fulladdr (car a) (car b) c))           ; c
                          (cons (car (fulladdr (car a) (car b) c)) nl) ; nl
                         ))
                   ))
  )

