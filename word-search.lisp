(in-package #:word-search)

;;; global states needed
(defvar *canvas-w* 1000)
(defvar *canvas-h* 950)
(defvar *click* nil) ;t when mouse is being pressed, nil otherwise
(defvar *color1* (gamekit:vec4 0 0 0 1)) ;for drawing
(defvar *color2* (gamekit:vec4 0.1 0.3 0.9 0.5))
(defvar *color3* (gamekit:vec4 0.8 0.8 0.8 0.5))

(defvar st)
(defvar en)
(defvar cont 420)
(defvar st_b t)
;;;
;;; Main Class to run game

(gamekit:defgame word-search()()
	(:viewport-width *canvas-w*)
	(:viewport-height *canvas-h*)
	(:viewport-title "Word Search Game")

)

(defun valid(x y)
	(and (and (< x 600) (> x -600)) (and (< y 600) (> y -600)))   
)

;;; Bindings
(defmethod gamekit:post-initialize ((app word-search))
	(gamekit:bind-button :mouse-left :pressed
				(lambda () (setf *click* t)))
	(gamekit:bind-button :mouse-left :released 
				(lambda () (setf *click* nil)))
	(gamekit:bind-cursor(lambda(x y)
				(when *click*
				;; put x, y position into doing something here - translate into input of currfile
				;; INPUT GOES IN HERE 
				
				;; for instructions "screen"
				(if (eq cont 420)
					(progn (setf cont 1)
					(return-from gamekit:post-initialize))
				)
				
				;; do input things
				(if (st_b)
					(progn 
						(let ((xx 600/x) (yy 600/y))
							(format t "~% X ~a Y ~a ~%" xx yy)
							(if (not (valid xx yy))
								(princ ">:( Click a square within the board") ; needs to be a quick draw/flash of text
								(setf st (list xx yy))
							)
						)
					) ; true => store start
					(progn
						(let ((xx 600/x) (yy 600/y)
							(format t "~% X ~a Y ~a ~%" xx yy)
							(if (not (valid xx yy))
								(princ ">:(( Click a square within the board") ; needs to be a quick draw/flash of text
								(setf st (list xx yy))
							)
						)
						
						)
					) ; false => store end
				)

				)))

	(gamekit:bind-button :q :pressed (lambda () 
					;quit function
					(gamekit:stop)
					))
)

;;Drawing Game Board
(defmethod gamekit:draw((app word-search))
	;do all drawing stuff inside here --> AT START OF GAME
	(gamekit:draw-rect (gamekit:vec2 0 0) 1000 1000 :fill-paint *color1* :stroke-paint nil) ;background black
	(gamekit:draw-rect (gamekit:vec2 200 300) 600 600 :fill-paint nil :stroke-paint *color2*) ;draw 10 by 10 grid
	(gamekit:draw-line (gamekit:vec2 300 300) (gamekit:vec2 300 900) *color2*)
	(gamekit:draw-line (gamekit:vec2 400 300) (gamekit:vec2 400 900) *color2*) 
	(gamekit:draw-line (gamekit:vec2 500 300) (gamekit:vec2 500 900) *color2*) 
	(gamekit:draw-line (gamekit:vec2 600 300) (gamekit:vec2 600 900) *color2*) 
	(gamekit:draw-line (gamekit:vec2 700 300) (gamekit:vec2 700 900) *color2*) 
	;vertical lines above, and now horizontal lines below
	(gamekit:draw-line (gamekit:vec2 200 400) (gamekit:vec2 800 400) *color2*) 
	(gamekit:draw-line (gamekit:vec2 200 500) (gamekit:vec2 800 500) *color2*) 
	(gamekit:draw-line (gamekit:vec2 200 600) (gamekit:vec2 800 600) *color2*) 
	(gamekit:draw-line (gamekit:vec2 200 700) (gamekit:vec2 800 700) *color2*) 
	(gamekit:draw-line (gamekit:vec2 200 800) (gamekit:vec2 800 800) *color2*) 

 	;;---------------------------------
	(gamekit:draw-text "WORD SEARCH: made from LISP" (gamekit:vec2 250 925) :fill-color *color3*) ; title
	
	(gamekit:draw-text "By: Keepers of the Parentheses" (gamekit:vec2 500 125) :fill-color *color3*) ; group name

 )

