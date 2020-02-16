;; inf loop
;; read input into a var
(defvar playing t)
(defvar input)
(defvar start)
(defvar end)
;; (setq print-case :downcase) 

(defun test() 
    (write-string "Enter the starting cell coordintes in parantheses, ex (x y): ")
    (setq start (read-line))
    (write-string "Enter the ending cell coordintes in parantheses, ex (x y): ")
    (setq end (read-line))
)