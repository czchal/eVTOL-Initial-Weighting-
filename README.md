# eVTOL-Initial-Weighting-
This repository contains method that can be used for the weight estimation of new eVTOL design based  on the method described by Osita Ugwueze et al[An Efficient and Robust Sizing Method for eVTOL Aircraft Configurations in Conceptual Design]


# Weighting

Power lift, Independent Lift ( Cruise + Hover) 

1. eVTOL Aircraft Mass Modelling
    
    ![1](/assets/1.png "MarineGEO logo")
    
    typical climb rate = 5.83 m/s
    
    However, in forward flight (which occurs in the climb, cruise, and descent phases), flight mechanics differ between the two types. Therefore, the powered lift type is treated as a fixed winged aircraft, and the corresponding fixed-wing power models are applied, albeit with adaptations for a battery energy source.
    
    - **Power model**
    
    **Hover mode**⇒ actuator disk theory: The ideal power required to hover (Phv,i). T = W( assumption) 
    
     ![2](/assets/2.png "MarineGEO logo")
    
    Figure of Merit( FM) is introduced to account for lose due ot profile drag. 
    
     ![3](/assets/3.png "MarineGEO logo")
    
    The power required for vertical flight is determined from a ratio of the hover power and the power induced by the relative vertical velocity (Vv) that the aircraft encounters. This is called the power ratio [22]. The power ratio for the climb can be expressed as:
    
     ![4](/assets/4.png "MarineGEO logo")
    
   
    **Cruise mode:** Power required: 
    
     ![5](/assets/5.png "MarineGEO logo")
    where: 
    
     ![6](/assets/6.png "MarineGEO logo")
    
    Parasite drag: ⇒ used chapter 12 of Daniel P. Raymer - Aircraft Design_ A Conceptual Approach-American Institute of Aeronautics and Astronautics Inc. (2018)
