(cl:pushnew :bodge-gl2 cl:*features*)
(asdf:defsystem :word-search
	:description "Word Search Game made in LISP for BC Game Jam 2020"
	:author "Keepers of the Parentheses Erica Mitch and VJ"
	:depends-on(trivial-gamekit)
	:components((
		(:file "word-search")
	))
)
