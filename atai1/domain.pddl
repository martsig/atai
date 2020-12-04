;Header and description

(define (domain make_tools)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types 
    location person item - object
)

; un-comment following line if constants are needed
(:constants 
    furnace workbench chest - location
    log wood stick iron_ingot iron_sword coal torch iron_shovel gold_ingot gold_axe gold_ore iron_ore - item
)

(:predicates 
(free-hand ?p - person)
(in-hand ?p - person ?i - item)
(at-location ?p - person  ?l - location)
(location-free ?l - location)
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
        (over all (not (= ?l1 ?l2)))
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
(:durative-action craft_wood
    :parameters (?p - person)
    :duration (= ?duration 2)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 1))
    	(at start (= (num-location-items workbench wood) 0))
	(at start (= (num-location-items workbench stick) 0))
	(at start (= (num-location-items workbench iron_ingot) 0))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 0))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 0))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 4)
        (assign (num-location-items workbench stick) 0)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 0)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 0)
        (assign (num-location-items workbench iron_shovel) 0)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 0)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_stick
    :parameters (?p - person)
    :duration (= ?duration 1)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 0))
    	(at start (= (num-location-items workbench wood) 2))
	(at start (= (num-location-items workbench stick) 0))
	(at start (= (num-location-items workbench iron_ingot) 0))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 0))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 0))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 0)
        (assign (num-location-items workbench stick) 4)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 0)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 0)
        (assign (num-location-items workbench iron_shovel) 0)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 0)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_iron_sword
    :parameters (?p - person)
    :duration (= ?duration 3)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 0))
    	(at start (= (num-location-items workbench wood) 0))
	(at start (= (num-location-items workbench stick) 1))
	(at start (= (num-location-items workbench iron_ingot) 2))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 0))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 0))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 0)
        (assign (num-location-items workbench stick) 0)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 1)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 0)
        (assign (num-location-items workbench iron_shovel) 0)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 0)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_torch
    :parameters (?p - person)
    :duration (= ?duration 2)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 0))
    	(at start (= (num-location-items workbench wood) 0))
	(at start (= (num-location-items workbench stick) 1))
	(at start (= (num-location-items workbench iron_ingot) 0))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 1))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 0))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 0)
        (assign (num-location-items workbench stick) 0)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 0)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 4)
        (assign (num-location-items workbench iron_shovel) 0)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 0)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_shovel
    :parameters (?p - person)
    :duration (= ?duration 4)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 0))
    	(at start (= (num-location-items workbench wood) 0))
	(at start (= (num-location-items workbench stick) 1))
	(at start (= (num-location-items workbench iron_ingot) 2))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 0))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 0))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 0)
        (assign (num-location-items workbench stick) 0)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 0)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 0)
        (assign (num-location-items workbench iron_shovel) 1)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 0)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_gold_axe
    :parameters (?p - person)
    :duration (= ?duration 4)
    :condition 
    (and
    	(over all (at-location ?p workbench))
    	(at start (location-free workbench))
    	(at start (= (num-location-items workbench log) 0))
    	(at start (= (num-location-items workbench wood) 0))
	(at start (= (num-location-items workbench stick) 1))
	(at start (= (num-location-items workbench iron_ingot) 0))
    	(at start (= (num-location-items workbench iron_sword) 0))
    	(at start (= (num-location-items workbench coal) 0))
    	(at start (= (num-location-items workbench torch) 0))
    	(at start (= (num-location-items workbench iron_shovel) 0))
    	(at start (= (num-location-items workbench gold_ingot) 3))
    	(at start (= (num-location-items workbench gold_axe) 0))
    	(at start (= (num-location-items workbench gold_ore) 0))
    	(at start (= (num-location-items workbench iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free workbench)))
        (at end (and 
        (assign (num-location-items workbench log) 0)
        (assign (num-location-items workbench wood) 0)
        (assign (num-location-items workbench stick) 0)
        (assign (num-location-items workbench iron_ingot) 0)
        (assign (num-location-items workbench iron_sword) 0)
        (assign (num-location-items workbench coal) 0)
        (assign (num-location-items workbench torch) 0)
        (assign (num-location-items workbench iron_shovel) 0)
        (assign (num-location-items workbench gold_ingot) 0)
        (assign (num-location-items workbench gold_axe) 1)
        (assign (num-location-items workbench gold_ore) 0)
        (assign (num-location-items workbench iron_ore) 0)
        (location-free workbench)
        ))
        )
)

(:durative-action craft_gold_ingot
    :parameters (?p - person)
    :duration (= ?duration 15)
    :condition 
    (and
    	(at start (at-location ?p furnace))
    	(at start (location-free furnace))
    	(at start (= (num-location-items furnace log) 0))
    	(at start (= (num-location-items furnace wood) 1))
	(at start (= (num-location-items furnace stick) 0))
	(at start (= (num-location-items furnace iron_ingot) 0))
    	(at start (= (num-location-items furnace iron_sword) 0))
    	(at start (= (num-location-items furnace coal) 0))
    	(at start (= (num-location-items furnace torch) 0))
    	(at start (= (num-location-items furnace iron_shovel) 0))
    	(at start (= (num-location-items furnace gold_ingot) 0))
    	(at start (= (num-location-items furnace gold_axe) 0))
    	(at start (= (num-location-items furnace gold_ore) 1))
    	(at start (= (num-location-items furnace iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free furnace)))
        (at end (and 
        (assign (num-location-items furnace log) 0)
        (assign (num-location-items furnace wood) 0)
        (assign (num-location-items furnace stick) 0)
        (assign (num-location-items furnace iron_ingot) 0)
        (assign (num-location-items furnace iron_sword) 0)
        (assign (num-location-items furnace coal) 0)
        (assign (num-location-items furnace torch) 0)
        (assign (num-location-items furnace iron_shovel) 0)
        (assign (num-location-items furnace gold_ingot) 1)
        (assign (num-location-items furnace gold_axe) 0)
        (assign (num-location-items furnace gold_ore) 0)
        (assign (num-location-items furnace iron_ore) 0)
        (location-free furnace)
        ))
        )
)

(:durative-action craft_iron_ingot
    :parameters (?p - person)
    :duration (= ?duration 10)
    :condition 
    (and
    	(at start (at-location ?p furnace))
    	(at start (location-free furnace))
    	(at start (= (num-location-items furnace log) 0))
    	(at start (= (num-location-items furnace wood) 1))
	(at start (= (num-location-items furnace stick) 0))
	(at start (= (num-location-items furnace iron_ingot) 0))
    	(at start (= (num-location-items furnace iron_sword) 0))
    	(at start (= (num-location-items furnace coal) 0))
    	(at start (= (num-location-items furnace torch) 0))
    	(at start (= (num-location-items furnace iron_shovel) 0))
    	(at start (= (num-location-items furnace gold_ingot) 0))
    	(at start (= (num-location-items furnace gold_axe) 0))
    	(at start (= (num-location-items furnace gold_ore) 0))
    	(at start (= (num-location-items furnace iron_ore) 1))
    )
    :effect (and 
        (at start (not (location-free furnace)))
        (at end (and 
        (assign (num-location-items furnace log) 0)
        (assign (num-location-items furnace wood) 0)
        (assign (num-location-items furnace stick) 0)
        (assign (num-location-items furnace iron_ingot) 1)
        (assign (num-location-items furnace iron_sword) 0)
        (assign (num-location-items furnace coal) 0)
        (assign (num-location-items furnace torch) 0)
        (assign (num-location-items furnace iron_shovel) 0)
        (assign (num-location-items furnace gold_ingot) 0)
        (assign (num-location-items furnace gold_axe) 0)
        (assign (num-location-items furnace gold_ore) 0)
        (assign (num-location-items furnace iron_ore) 0)
        (location-free furnace)
        ))
        )
)

(:durative-action craft_coal
    :parameters (?p - person)
    :duration (= ?duration 8)
    :condition 
    (and
    	(at start (at-location ?p furnace))
    	(at start (location-free furnace))
    	(at start (= (num-location-items furnace log) 1))
    	(at start (= (num-location-items furnace wood) 1))
	(at start (= (num-location-items furnace stick) 0))
	(at start (= (num-location-items furnace iron_ingot) 0))
    	(at start (= (num-location-items furnace iron_sword) 0))
    	(at start (= (num-location-items furnace coal) 0))
    	(at start (= (num-location-items furnace torch) 0))
    	(at start (= (num-location-items furnace iron_shovel) 0))
    	(at start (= (num-location-items furnace gold_ingot) 0))
    	(at start (= (num-location-items furnace gold_axe) 0))
    	(at start (= (num-location-items furnace gold_ore) 0))
    	(at start (= (num-location-items furnace iron_ore) 0))
    )
    :effect (and 
        (at start (not (location-free furnace)))
        (at end (and 
        (assign (num-location-items furnace log) 0)
        (assign (num-location-items furnace wood) 0)
        (assign (num-location-items furnace stick) 0)
        (assign (num-location-items furnace iron_ingot) 0)
        (assign (num-location-items furnace iron_sword) 0)
        (assign (num-location-items furnace coal) 1)
        (assign (num-location-items furnace torch) 0)
        (assign (num-location-items furnace iron_shovel) 0)
        (assign (num-location-items furnace gold_ingot) 0)
        (assign (num-location-items furnace gold_axe) 0)
        (assign (num-location-items furnace gold_ore) 0)
        (assign (num-location-items furnace iron_ore) 0)
        (location-free furnace)
        ))
        )
)




)

