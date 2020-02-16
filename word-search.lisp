;; ;;;
;; ;; (:cl :defpackage :word-search
;; ;; (:use :cl)
;; ;; (:export word-search))
;; ;; (:cl :in-package :word-search)

;; (defpackage "word-search"
;;    (:use "cl" :trivial-gamekit)
;;    (:export :main :start)
;; )
;; ;(make-package :word-search)
(in-package #:word-search)

;;; global states needed
(defvar *canvas-w* 1000)
(defvar *canvas-h* 1000)
(defvar *click* nil) ;t when mouse is being pressed, nil otherwise
(defvar *color1* (gamekit:vec4 0 0 0 1)) ;for drawing
(defvar *color2* (gamekit:vec4 0.1 0.3 0.9 0.5))
;;;
;;; Main Class to run game

(gamekit:defgame word-search()()
	(:viewport-width *canvas-w*)
	(:viewport-height *canvas-h*)
	(:viewport-title "Word Search Game")
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
				)))

	(gamekit:bind-button :q :pressed (lambda () 
					;quit function
					(gamekit:stop)
					))
)

;;Drawing Game Board
(defmethod gamekit:draw((app word-search))
  ;do all drawing stuff inside here
  (gamekit:draw-rect (gamekit:vec2 0 0) 1000 1000 :fill-paint *color1* :stroke-paint nil) ;background black
  (gamekit:draw-rect (gamekit:vec2 200 300) 600 600 :fill-paint nil :stroke-paint *color2*) ;draw 10 by 10 grid
  (gamekit:draw-line (gamekit:vec2 300 300) (gamekit:vec2 300 900) *color2*)
  (gamekit:draw-line (gamekit:vec2 400 300) (gamekit:vec2 400 900) *color2*) 
  (gamekit:draw-line (gamekit:vec2 500 300) (gamekit:vec2 500 900) *color2*) 
  (gamekit:draw-line (gamekit:vec2 600 300) (gamekit:vec2 600 900) *color2*) 
  (gamekit:draw-line (gamekit:vec2 700 300) (gamekit:vec2 700 900) *color2*) 
  
	
 )

