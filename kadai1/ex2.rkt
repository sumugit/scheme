(define map-tree2
  (lambda (fn tree)(
                    ;null
                    cond ((null? tree) '())
                         ;dot-pair
                         ;access by 1 atom
                         ((pair? tree) (map (lambda (t)(map-tree2 fn t)) tree))
                         ;atom
                         (else (fn tree))
                         )
    ))