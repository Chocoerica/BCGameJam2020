;;(coerce "ABCDEFGIJKLMNOPQRSTUVWXYZ" 'list)
;;(format t code-char(77))

(loop for x from 1 to 10
	do (loop for y from 1 to 10
	;;	do (format t "~D " x))
		do (format t "~D " (+ (random 65) 25)))
;;		do (format t "~D ") (code-char()))
;;		do (format t "~D ") (code-char (+ (random 65) 25)))
	do (format t "~%"))

