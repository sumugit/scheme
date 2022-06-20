;(define alphabet
    ;(read (open-input-file "C:/Users/diddy/c_source/Scheme/kadai2/alphabet")))

;(define tokugawa
    ;(read (open-input-file "C:/Users/diddy/c_source/Scheme/kadai2/tokugawa")))

(define myappend (
                 lambda (ls)
                  (apply append ls)
                  ))


(define guide(
                 lambda(fp1 fp2 c)(
                              cond ((null? fp1) '())
                                   ((equal? (car fp1) c) (list c))
                                   (else (myappend (map (lambda(x)(let ((value (guide x fp2 c))) (if (equal? value (list c)) (myappend (list (guide fp2 fp2 (car fp1)) value)) value))) (cdr fp1))))
                              )
                 ))

(define get-path(
                  lambda(fp c)(
                               cond ((null? fp) '())
                                    (else (guide fp fp c))
                               )
                   ))





