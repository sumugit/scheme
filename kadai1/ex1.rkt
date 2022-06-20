(define map-tree
  (lambda (fn tree)(
                    ;null
                    cond ((null? tree) '())
                         ;dot-pair
                         ((pair? tree) (cons (map-tree fn (car tree))
                                       (map-tree fn (cdr tree))))
                         ;atom
                         (else (fn tree))
                         )
    ))