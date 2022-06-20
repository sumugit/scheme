(define-syntax stream-cons
    (syntax-rules ()
        ((_ x y) (cons x (delay y)))
    ))

(define-syntax stream-car
    (syntax-rules ()
        ((_ x) (car x ))
    ))

(define-syntax stream-cdr
    (syntax-rules ()
        ((_ x) (force (cdr x)))
    ))

(define numbers (lambda ()
  (letrec ((stream
              (lambda (n) (stream-cons n (stream (+ n 1))))
          ))
          (stream 2))))


(define sieve (lambda (n l)
  (letrec ((stream
              (lambda (num L)(if (= (modulo (stream-car L) num) 0) (stream num (stream-cdr L)) (stream-cons (stream-car L) (stream num (stream-cdr L)))))
          ))
          (stream n l))))


(define prime (lambda (n)
  (letrec ((stream
              (lambda (n L) (if (<= n 0) '() (cons (stream-car L) (stream (- n 1) (sieve (stream-car L) L)))))
          ))
          (stream n (numbers)))))


