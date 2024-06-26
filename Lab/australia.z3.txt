; coloring australia
(set-option :produce-models true)

; RED => 0
; GREEN => 1
; BLUE => 2

; variables
(declare-const WA Int)
(declare-const NT Int)
(declare-const SA Int)
(declare-const Q Int)
(declare-const NSW Int)
(declare-const V Int)
(declare-const T Int)

; domains
(assert (and (>= WA 0) (<= WA 2)))
(assert (and (>= NT 0) (<= NT 2)))
(assert (and (>= SA 0) (<= SA 2)))
(assert (and (>= Q 0) (<= Q 2)))
(assert (and (>= NSW 0) (<= NSW 2)))
(assert (and (>= V 0) (<= V 2)))
(assert (and (>= T 0) (<= T 2)))

; adjacency constraints
(assert (not (= WA SA)))
(assert (and (not (= NT WA)) (not (= NT SA)) (not (= NT Q))))
(assert (and (not (= Q SA)) (not (= Q NSW))))
(assert (distinct SA NSW V))

; check if satisfiable
(check-sat)

; print result
(get-value (WA))
(get-value (NT))
(get-value (SA))
(get-value (Q))
(get-value (NSW))
(get-value (V))
(get-value (T))
