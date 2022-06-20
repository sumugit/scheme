(define diff2(
              lambda (ope1 a)(
                               cond ((number? ope1) 0)
                                    ((equal? ope1 a) 1)
                                    ((symbol? ope1) 0)
                                    ((equal? '+ (car ope1)) (cons '+ (map (lambda (x)(diff2 x a)) (cdr ope1))))
                                    ((equal? '- (car ope1)) (cons '- (map (lambda (x)(diff2 x a)) (cdr ope1))))
                                    ((equal? '* (car ope1)) (list '+ (list '* (car (cdr ope1)) (diff2 (car (cdr (cdr ope1))) a)) (list '* (diff2 (car (cdr ope1)) a) (car (cdr (cdr ope1))))))
                                    (else (list '* (car (cdr (cdr ope1))) (list '* (diff2 (car (cdr ope1)) a) (list '** (car (cdr ope1)) (- (car (cdr (cdr ope1))) 1)))))
                                 )
               ))