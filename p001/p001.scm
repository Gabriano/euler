;; Project Euler -- Problem 1
;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.
;;
;; Find the sum of all the multiples of 3 or 5 below 1000.
;; ref: http://projecteuler.net/index.php?section=problems&id=1
;;

(define L 1000)

;; Solution 1
(define (mul_sum b s m)
  (if (>= m L)
      s
      (mul_sum b (+ s m) (+ m b))))

(display (time (- (+ (mul_sum 3 0 3)
                     (mul_sum 5 0 5))
                  (mul_sum 15 0 15))))(newline)

;; Solution 2
(define (sum_3 t m)
  (if (>= m L)
      t
      (sum_3 (+ t m) (+ m 3))))

(define (sum_5 t m)
  (if (>= (+ m 5) L)
      (+ t m)
      (sum_5 (+ t (* 2 m) 5)
             (+ m 15))))

(display (time (+ (sum_3 0 3)
                  (sum_5 0 5))))(newline)

;; Solution 3
(define (mul_sum_2 b L)
  (let ((q (quotient L b)))
    (/ (* b q (+ q 1))
       2)))

(display (time (- (+ (mul_sum_2 3 999)
                     (mul_sum_2 5 999))
                  (mul_sum_2 15 999))))(newline)
