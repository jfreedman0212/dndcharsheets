//
//  Dice.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit

func Roll(dice:(Int,Int),adv: Bool = false,disadv: Bool = false)->Int{
    var result: Int = 0;
    if adv {
        let rand1 = Int(arc4random_uniform(UInt32(dice.1))+1);
        let rand2 = Int(arc4random_uniform(UInt32(dice.1))+1);
        if rand1 > rand2{
            return rand1;
        } else {
            return rand2;
        }
    }
    if disadv {
        let rand1 = Int(arc4random_uniform(UInt32(dice.1))+1);
        let rand2 = Int(arc4random_uniform(UInt32(dice.1))+1);
        if rand1 < rand2{
            return rand1;
        } else {
            return rand2;
        }
    }
    for _ in 1...dice.0{
        result += Int(arc4random_uniform(UInt32(dice.1))+1);
    }
    return result;
}
