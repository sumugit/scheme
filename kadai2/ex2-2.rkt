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


(define search(
                 lambda(fp c d)(
                                cond ((null? (cdr fp)) 0)
                                     (else (let ((value (apply + (map (lambda(t)(if (equal? c t) d 0)) (get-depth fp d))))) (if (> value 0) value (search fp c (+ d 1)))))
                              )))


(define get-cousin
  (lambda (fp c)(
                 get-depth fp (search fp c 1)                    
                 )))