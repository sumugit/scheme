;(define alphabet
    ;(read (open-input-file "C:/Users/diddy/c_source/Scheme/kadai2/alphabet")))

;(define tokugawa
    ;(read (open-input-file "C:/Users/diddy/c_source/Scheme/kadai2/tokugawa")))

(define myappend (
                 lambda (ls)
                  (apply append ls)
                  ))

(define get-depth
  (lambda (fp d)(
                    cond ((null? fp)  '())
                         ((= d 1) (map car (cdr fp)))
                         ;cdr recursive
                         (else (myappend (map (lambda (f)(get-depth f (- d 1))) (cdr fp)))
                         ))
    ))
