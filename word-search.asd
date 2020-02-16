;; (cl:pushnew :bodge-gl2 cl: *features*)
(asdf:defsystem "lisp-search"
	:description "Word Search Game made in LISP for BC Game Jam 2020 cuz we wanted to"
	:author "Keepers of the Parentheses Erica Mitch and VJ"
	:depends-on(trivial-gamekit)
	:components(
		(:file "package")
		(:file "lisp-search")		
		))
