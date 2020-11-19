;Header and description

(define (domain make_tools)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

;(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
;)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
(LOCATION ?x) (FURNACE ?x) (WORKBENCH ?x) (CHEST ?x)
(PERSON ?p)
(at-chest ?p) (at-workbench ?p) (at-furnace ?p)
(free-workbench ?b) (free-furnace ?p)
)


;(:functions ;todo: define numeric functions here
;)

; transfers

(:durative-action go-to-chest-from-workbench
    :parameters (?p)
    :duration (= ?duration 2)
    :condition (and 
        (at start (and 
        (at-workbench ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-chest ?p)))
    )
)

(:durative-action go-to-workbench-from-chest
    :parameters (?p)
    :duration (= ?duration 2)
    :condition (and 
        (at start (and 
        (at-chest ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-workbench ?p)))
    )
)

(:durative-action go-to-chest-from-furnace
    :parameters (?p)
    :duration (= ?duration 3)
    :condition (and 
        (at start (and 
        (at-furnace ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-chest ?p)))
    )
)

(:durative-action go-to-furnace-from-chest
    :parameters (?p)
    :duration (= ?duration 3)
    :condition (and 
        (at start (and 
        (at-chest ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-furnace ?p)))
    )
)

(:durative-action go-to-furnace-from-workbench
    :parameters (?p)
    :duration (= ?duration 4)
    :condition (and 
        (at start (and 
        (at-workbench ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-furnace ?p)))
    )
)

(:durative-action go-to-workbench-from-furnace
    :parameters (?p)
    :duration (= ?duration 4)
    :condition (and 
        (at start (and 
        (at-furnace ?p)))
        (over all (and 
        (PERSON ?p)))
        (at end (and 
        (PERSON ?p)))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        (at-workbench ?p)))
    )
)

)