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