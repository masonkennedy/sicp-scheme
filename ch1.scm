;BEGIN
; This document "ch1.scm" contains a reproduction of some of the code from
; the Structure and Interpretation of Computer Programs (SICP), as well as some
; attempts at some of the exercises.
;

(define
  (square x) (* x x))

(define
  (cube x) (* x x x))

; needs to be fixed!!
;(define
;  (power n x)
;  (if (= n 0) 1 (power (- n 1) x)))

(define (sum-of-squares x y) (+ (square x) (square y) ) )

(define (abs x)
  (if (< x 0)
      (- x)
      x
  )
)

(define
  (average x y) (/ (+ x y) 2))


;;;;;;;; EXAMPLE: square roots by newton's method.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)
  )
)

; A guess is improved by averaging it with the quotient of the radical and the
; old guess:

(define (improve guess x)
  (average guess (/ x guess))
)

(define
  (good-enough? guess x)
  (< (abs (- (square guess) x)) .01)
)

(define (sqrt x) (sqrt-iter 1.0 x))





;;;;;;;;;;;;;;;;;;;;;;;
; CHAPTER 1 EXERCISES
;;;;;;;;;;;;;;;;;;;;;;;

;; Exercise 1.2 (should return -34/150)

(define a (/ (+ 5
                4  (- 2
                      (- 3
                         (+ 6
                           (/ 4
                              5)
                         )
                      )
                   )
              )
              (* 3 (- 6
                      2)
                   (- 2
                      7)
              )
           )
)


;; Exercise 1.3

(define (>= x y) (or (> x y) (= x y)))
(define (sos-of-the-big-two a b c)
  (cond ((and (>= a c) (>= b c) ) (sum-of-squares a b) )
        ((and (>= a b) (>= c b) ) (sum-of-squares a c) )
        ((and (>= b a) (>= c a) ) (sum-of-squares b c) )
  )
)


;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; returns $a+|b|$.


;; Exercise 1.5: Ben Bitdiddle has invented a test to determine whether the
;; interpreter he is faced with is using normal-order evaluation or
;; applicative-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)(if (= x 0) 0 y))


;; If the interpreter uses applicative-order evaluation then the test will return $0$,
;; else it will return (p)


;; Exercise 1.6

; Alyssa P. Hacker doesn't see why {\tt if} needs to be provided as a special
; form. "Why can't I just define it as a special procedure in terms of {\tt cond}?"
; she asks. Alyssa's friend Eva Lu Ator claims this can be done, and she defines

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
  )
)

: Delighted, Alyssa uses {\tt new-if} to rewrite the square-root program

(define
  (sqrtier guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrtier (improve guess x) x)
    )
)

; Attempting to evaluate yields:

;   1 ]=> (sqrtier 1.0 2)
;         ... Aborting!: maximum recursion depth exceeded

; This is because trying to evaluating {\tt new-if} leads to a nonterminating
; recursive loop because the new-if was written as a function which follows
; applicative-order evaluation; hence the recursive sqrtier gets called before
; the cond gets checked.



;; Exercise 1.7



;; Exercise 1.8



;; Exercise 1.9



;; Exercise 1.10



;; Exercise 1.11



;; Exercise 1.12



;; Exercise 1.13



;; Exercise 1.14



;; Exercise 1.15



;; Exercise 1.16



;; Exercise 1.17



;; Exercise 1.18



;; Exercise 1.19



;; Exercise 1.20



;; Exercise 1.21



;; Exercise 1.22



;; Exercise 1.23



;; Exercise 1.24



;; Exercise 1.25



;; Exercise 1.26



;; Exercise 1.27



;; Exercise 1.28



;; Exercise 1.29



;; Exercise 1.30



;; Exercise 1.31



;; Exercise 1.32



;; Exercise 1.33



;; Exercise 1.34



;; Exercise 1.35



;; Exercise 1.36



;; Exercise 1.37



;; Exercise 1.38



;; Exercise 1.39



;; Exercise 1.40



;; Exercise 1.41



;; Exercise 1.42



;; Exercise 1.43



;; Exercise 1.44



;; Exercise 1.45



;; Exercise 1.46
