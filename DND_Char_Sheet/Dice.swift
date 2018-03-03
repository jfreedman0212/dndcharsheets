//
//  Dice.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit

func Roll(dice:(Int,Int),adv: Bool = false)->Int{
    var result: Int = 0;
    if adv {
        var rand1 = Int(arc4random_uniform(UInt32(dice.1))+1);
        var rand2 = Int(arc4random_uniform(UInt32(dice.1))+1);
    }
    for _ in 1...dice.0{
        result += Int(arc4random_uniform(UInt32(dice.1))+1);
    }
    return result;
}
