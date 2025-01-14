(define (domain cleaner-domain)

    (:requirements :strips)

    (:predicates
        (robot ?x)(loc ?x)(at ?x ?y)
        (adj ?x ?y)(free ?x)(has ?x ?y)
        (mop ?x)(vacuum ?x)(object ?x)
        (dirty ?x)
        (room ?x)(stairs ?x)
        (above ?x ?y)
    )

    (:action move
        :parameters (?r ?from ?to)
        :precondition (and (robot ?r)(loc ?from)(loc ?to)
                        (at ?r ?from)(adj ?from ?to))
        :effect (and (at ?r ?to)(not(at ?r ?from)))
    )
    
    (:action pick
        :parameters (?r ?o ?from)
        :precondition (and (robot ?r)(object ?o)(loc ?from)
                        (at ?r ?from)(at ?o ?from)
                        (free ?r))
        :effect (and(has ?r ?o)(not(free ?r))(not(at ?o ?from)))
    )
    
    (:action drop
        :parameters (?r ?o ?to)
        :precondition (and (robot ?r)(object ?o)(has ?r ?o)
                        (at ?r ?to)(loc ?to))
        :effect (and (at ?o ?to)(not(has ?r ?o))(free ?r))
    )
    
    (:action clean ;to clean room
        :parameters (?r ?v ?l)
        :precondition (and (robot ?r)(vacuum ?v)(room ?l)
                        (has ?r ?v)(at ?r ?l)(dirty ?l)
                        )
        :effect (and(not(dirty ?l)))
    )    
    
    (:action wash ;to wash stairs
        :parameters (?r ?m ?l ?s)
        :precondition (and(robot ?r)(mop ?m)(loc ?l)(stairs ?s)
                        (has ?r ?m)(at ?r ?l)(dirty ?s)
                        (above ?l ?s)
        )
        :effect (and(not(dirty ?s))(not (adj ?s ?l))(not (adj ?l ?s)))
    )
    
)