(define (problem make_tools_v1) (:domain make_tools)
(:objects 
    alice bob
    chest workbench furnace
)

(:init
    (FURNACE furnace) (CHEST chest) (WORKBENCH workbench)
    (PERSON alice)
    (at-workbench alice)
)

(:goal (and
    (at-chest alice)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
