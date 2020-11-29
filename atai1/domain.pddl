;Header and description

(define (domain make_tools)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types 
    ;location person item - object
)

; un-comment following line if constants are needed
(:constants 
    furnace workbench chest - location
    logs wood sticks iron_ingots iron_sword coal torches iron_shovel gold_ingots gold_axe gold_ore iron_ore - item
)

(:predicates 
(free-hand ?p - person)
(in-hand ?p - person ?i - item)
(at-location ?p - person  ?l - location)
)


(:functions 
    (move-cost ?l1 - location ?l2 - location)
    (num-location-items ?l - location ?i - item)
)

; TRANSFER
(:durative-action transfer
    :parameters (?p - person ?l1 - location ?l2 -location)
    :duration (= ?duration (move-cost ?l1 ?l2))
    :condition (and 
        (at start (at-location ?p ?l1))
        (over all (not (= ?l1 ?l2))
        )
    )
    :effect (and 
        (at start (not (at-location ?p ?l1)))
        (at end (at-location ?p ?l2))
        )
)


; PICK & PLACE
(:action pick
    :parameters (?p - person ?l - location ?i - item)
    :precondition(and
    (at-location ?p ?l)
    (free-hand ?p)
    (>= (num-location-items ?l ?i) 1)
    )
    :effect(and
    (not (free-hand ?p))
    (in-hand ?p ?i)
    (decrease (num-location-items ?l ?i) 1)
    )
) 

(:action place
    :parameters (?p - person ?l - location ?i - item)
    :precondition(and
    (at-location ?p ?l)
    (in-hand ?p ?i)
    )
    :effect(and
    (free-hand ?p)
    (not (in-hand ?p ?i))
    (increase (num-location-items ?l ?i) 1)
    )
)

;CRAFTING
   
)
