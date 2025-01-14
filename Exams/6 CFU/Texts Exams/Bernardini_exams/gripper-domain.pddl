(define (domain gripper-domain)

    (:requirements :strips)


    (:predicates (cylinder ?x)(tissue ?x)(loc ?x)(dirty ?x)
                 (holding ?x)(object ?x)(at ?x ?y)
                 (free) ; robot not holdign anything
                 (pickable ?x) ; means that we can pick object because it is not block
                 (empty ?x) ; means a location is empty
                 (on ?x ?y) ; means object x on top of y
                  )

    (:action pick-from-loc
        :parameters (?o ?l)
        :precondition (and(loc ?l)(object ?o)(free)(pickable ?o)(at ?o ?l))
        :effect (and(holding ?o)(not(free))(not(at ?o ?l))(not(pickable ?o))(empty ?l))
    )
    
    (:action pick-from-block
        :parameters (?o1 ?o2) ; o1 on top of o2
        :precondition (and(cylinder ?o1)(cylinder ?o2)(free)(pickable ?o1)(on ?o1 ?o2))
        :effect (and(holding ?o1)(not(free))(not(on ?o1 ?o2))(not(pickable ?o1))(pickable ?o2))
    )
    
    (:action drop
        :parameters (?o ?l)
        :precondition (and(object ?o)(loc ?l)(holding ?o)(empty ?l))
        :effect (and(not(holding ?o))(free)(not(empty ?l))(pickable ?o)(at ?o ?l))
    )
    
    (:action stack
        :parameters (?o1 ?o2) ;we stack o1 on top of o2
        :precondition (and(cylinder ?o1)(cylinder ?o2)(holding ?o1)(pickable ?o2))
        :effect (and(not(holding ?o1))(free)(not(pickable ?o2))(on ?o1 ?o2)(pickable ?o1))
    )
    
    (:action clean
        :parameters (?t ?l)
        :precondition (and(tissue ?t)(holding ?t)(loc ?l)(dirty ?l))
        :effect (and(not(dirty ?l))(empty ?l))
    )
    
)