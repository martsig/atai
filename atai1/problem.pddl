(define (problem make_tools_v1) (:domain make_tools)
(:objects 
    alice bob - person
)

(:init
    (at-location alice workbench)
    (free-hand alice)
    (at-location bob chest)
    (free-hand bob)
    
    ;free locations
    (location-free furnace)
    (location-free workbench)

    ; time costs of movement
    (= (move-cost chest workbench) 2)
    (= (move-cost workbench chest) 2)
    (= (move-cost chest furnace) 3)
    (= (move-cost furnace chest) 3)
    (= (move-cost furnace workbench) 4)
    (= (move-cost workbench furnace) 4)
    
    (= (num-location-items chest wood) 0)
    (= (num-location-items workbench wood) 0)
    (= (num-location-items furnace wood) 0)
    
    (= (num-location-items chest log) 3)
    (= (num-location-items workbench log) 0)
    (= (num-location-items furnace log) 0)
    
    (= (num-location-items chest stick) 0)
    (= (num-location-items workbench stick) 0)
    (= (num-location-items furnace stick) 0)
    
    (= (num-location-items chest iron_ingot) 0)
    (= (num-location-items workbench iron_ingot) 0)
    (= (num-location-items furnace iron_ingot) 0)
    
    (= (num-location-items chest iron_sword) 0)
    (= (num-location-items workbench iron_sword) 0)
    (= (num-location-items furnace iron_sword) 0)
    
    (= (num-location-items chest coal) 0)
    (= (num-location-items workbench coal) 0)
    (= (num-location-items furnace coal) 0)
    
    (= (num-location-items chest torch) 0)
    (= (num-location-items workbench torch) 0)
    (= (num-location-items furnace torch) 0)
    
    (= (num-location-items chest iron_shovel) 0)
    (= (num-location-items workbench iron_shovel) 0)
    (= (num-location-items furnace iron_shovel) 0)
    
    (= (num-location-items chest gold_ingot) 0)
    (= (num-location-items workbench gold_ingot) 0)
    (= (num-location-items furnace gold_ingot) 0)
    
    (= (num-location-items chest gold_axe) 0)
    (= (num-location-items workbench gold_axe) 0)
    (= (num-location-items furnace gold_axe) 0)
    
    (= (num-location-items chest gold_ore) 3)
    (= (num-location-items workbench gold_ore) 0)
    (= (num-location-items furnace gold_ore) 0)
    
    (= (num-location-items chest iron_ore) 6)
    (= (num-location-items workbench iron_ore) 0)
    (= (num-location-items furnace iron_ore) 0)

)


(:goal (and
    ;(= (num-location-items chest torch) 1)
    (= (num-location-items chest iron_sword) 1)
    (= (num-location-items chest iron_shovel) 1)
    (= (num-location-items chest gold_axe) 1)
))
)
