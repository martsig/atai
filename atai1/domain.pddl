;Header and description

(define (domain make_tools)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    chest workbench furnace - location
    logs woods sticks iron_ingots iron_sword coal torches iron_shovel gold_ingots gold_axe gold_ore iron_ore - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
(free-hand ?p)

; new predicates
(at-location ?p ?l)
)


(:functions 
    (move-cost ?l1 - location ?l2 - location)
)

; TRANSFER
(:durative-action transfer
    :parameters (?p - person ?l1 - location ?l2 -location)
    :duration (= ?duration (move-cost ?l1 ?l2))
    :condition (and 
        (at start (not (at-location ?p ?l2)
        ))
        (over all (not (= ?l1 ?l2)
        ))
    )
    :effect (and 
        (at end  (at-location ?p ?l2)
        )
    )
)



)