;Header and description

(define (domain make_tools)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    chest workbench furnace - place
    logs woods sticks iron_ingots iron_sword coal torches iron_shovel gold_ingots gold_axe gold_ore iron_ore - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
(FURNACE ?x) (WORKBENCH ?x) (CHEST ?x)
(PERSON ?p)
(at-chest ?p) (at-workbench ?p) (at-furnace ?p)
(free-workbench ?b) (free-furnace ?p)
(free-hand ?p)
)


(:functions 
    (logs ?l - place)
    (woods ?w - place)
    (sticks ?s - place)
    (iron_ingots ?iing - place)
    (iron_sword ?iswo - place)
    (coal ?c - place)
    (torches ?t - place)
    (iron_shovel ?isho - place)
    (gold_ingots ?gi - place)
    (gold_axe ?gaxe - place)
    (gold_ore ?gore - place)
    (iron_ore ?iore - place)
)

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

; pick & place
(:action pick
    :parameters (?p - PERSON ?pl - place ?o - object)
    :precondition (and 
    (at start and (
        
    ))
    )
    :effect (and )
)


)