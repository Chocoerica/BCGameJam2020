;; inf loop
;; read input into a var
(defvar playing t)
(defvar start)
(defvar end)
(defvar size 25) ;; temp here till integrated into main program


(princ "Welcome to the end of you existence")
(terpri)
(princ "Enter (x y) coordinates when prompted including the paranthesis.")
(terpri)
(princ "Enter Y to begin..............")
(read)

;; start game loop

(defun take_input() 
    (princ "Enter starting coordinates in as a pair, ex (x y): ")
    (setq start (read-from-string (read-line)))

    (princ "Enter ending coordinates in as a pair, ex (x y): ")
    (setq end (read-from-string (read-line)))

    (if (or 
        
        (or (< (car start) 0) (>= (car start) size))
        (or (< (second start ) 0) (>= (second start) size))

        (or (< (car end) 0) (>= (car end) size))
        (or (< (second end ) 0) (>= (second end) size) )
        
        )
        ;; 0 <= start < size || 0 <= end < size
        (progn  (princ "Invalid input >:( ......Try again")
                (terpri)
                (take_input)
        )
    )
)

(take_input)
