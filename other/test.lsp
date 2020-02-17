

(loop for x from 1 to 20
	do (loop for y from 1 to 20
		do (format t "~A " (code-char (+ (random 25) 65))))
	do (format t "~%"))

