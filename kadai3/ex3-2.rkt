(define ** expt)

(define diff (
              lambda (ope)(
                               cond ((number? ope) 0)
                                     ((equal? ope 'x) 1)
                                     ((equal? '+ (car ope)) (cons '+ (map (lambda (x)(diff x)) (cdr ope))))
                                     ((equal? '- (car ope)) (cons '- (map (lambda (x)(diff x)) (cdr ope))))
                                     ((equal? '* (car ope)) (list '+ (list '* (car (cdr ope)) (diff (car (cdr (cdr ope))))) (list '* (diff (car (cdr ope))) (car (cdr (cdr ope))))))
                                     (else (list '* (car (cdr (cdr ope))) (list '* (diff (car (cdr ope))) (list '** (car (cdr ope)) (- (car (cdr (cdr ope))) 1)))))
                                     )
               ))


(define tangent (
                 lambda (ope a)(
                                cond ((number? a)(let ((g ((eval `(lambda (x) ,(diff ope)) (interaction-environment)) a)) (b ((eval `(lambda (x) ,ope) (interaction-environment)) a))) (list '+ (list '* g 'x) (- b (* a g)))))
                                     (else (display "Please input a numerical value."))
                                )

                  ))