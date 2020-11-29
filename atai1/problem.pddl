(define (problem make_tools_v1) (:domain make_tools)
(:objects 
    alice bob - person
)

(:init
    (at-location alice workbench)
    (free-hand alice)
    ;(in-hand alice wood)
    (at-location bob furnace)
    (free-hand bob)

    ; time costs of movement
    (= (move-cost chest workbench) 2)
    (= (move-cost workbench chest) 2)
    (= (move-cost chest furnace) 3)
    (= (move-cost furnace chest) 3)
    (= (move-cost furnace workbench) 4)
    (= (move-cost workbench furnace) 4)
    
    (= (num-location-items chest wood) 3)
    (= (num-location-items workbench wood) 0)
    (= (num-location-items furnace wood) 0)
)

(:goal (and
    (at-location alice furnace)
    (= (num-location-items workbench wood) 2)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
