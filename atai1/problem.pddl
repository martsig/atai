(define (problem make_tools_v1) (:domain make_tools)
(:objects 
    alice bob
    chest workbench furnace
)

(:init
    (at-workbench alice)
    (free-hand alice)

    ; time costs of movement
    (= (move-cost chest workbench) 2)
    (= (move-cost workbench chest) 2)
    (= (move-cost chest furnace) 3)
    (= (move-cost furnace chest) 3)
    (= (move-cost furnace workbench) 4)
    (= (move-cost workbench furnace) 4)
)

(:goal (and
    (at-furnace alice)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
