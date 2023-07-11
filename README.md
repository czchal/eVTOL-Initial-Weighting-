# eVTOL-Initial-Weighting-
This repository contains method that can be used for the weight estimation of new eVTOL design based  on the method described by Osita Ugwueze et al[An Efficient and Robust Sizing Method for eVTOL Aircraft Configurations in Conceptual Design]


# Weighting

Power lift, Independent Lift ( Cruise + Hover) 

1. eVTOL Aircraft Mass Modelling
    
    https://www.notion.so/Weighting-ca7f86e776244654aa92df001a144c65?pvs=4#78ad5d8aaead48b397fa87681902fdd5
    
    typical climb rate = 5.83 m/s
    
    However, in forward flight (which occurs in the climb, cruise, and descent phases), flight mechanics differ between the two types. Therefore, the powered lift type is treated as a fixed winged aircraft, and the corresponding fixed-wing power models are applied, albeit with adaptations for a battery energy source.
    
    - **Power model**
    
    **Hover mode**⇒ actuator disk theory: The ideal power required to hover (Phv,i). T = W( assumption) 
    
    ![Screenshot 2023-05-24 at 4.41.01 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9d73b1c2-15c5-4ff0-bc37-0f363081f28c/Screenshot_2023-05-24_at_4.41.01_PM.png)
    
    Figure of Merit( FM) is introduced to account for lose due ot profile drag. 
    
    ![Screenshot 2023-05-24 at 4.43.25 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/56a09463-1207-4a5b-aedd-c4b2ce8ba4e7/Screenshot_2023-05-24_at_4.43.25_PM.png)
    
    The power required for vertical flight is determined from a ratio of the hover power and the power induced by the relative vertical velocity (Vv) that the aircraft encounters. This is called the power ratio [22]. The power ratio for the climb can be expressed as:
    
    ![Screenshot 2023-05-24 at 9.36.32 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/467e8f20-6f1a-40d4-af02-b011f08ad0d7/Screenshot_2023-05-24_at_9.36.32_PM.png)
    
    ![Screenshot 2023-05-24 at 9.43.13 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/157321b4-969a-4716-aef5-d167c22c106e/Screenshot_2023-05-24_at_9.43.13_PM.png)
    
    **Cruise mode:** Power required: 
    
    ![Screenshot 2023-05-24 at 9.47.36 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/672add5b-cb74-4f37-a57f-3d6b02546a28/Screenshot_2023-05-24_at_9.47.36_PM.png)
    
    where: 
    
    ![Screenshot 2023-05-24 at 9.48.51 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fff9541c-bac9-4208-8995-64e1c6654836/Screenshot_2023-05-24_at_9.48.51_PM.png)
    
    Parasite drag: ⇒ used chapter 12 of Daniel P. Raymer - Aircraft Design_ A Conceptual Approach-American Institute of Aeronautics and Astronautics Inc. (2018)
