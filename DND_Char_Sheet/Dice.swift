//
//  Dice.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit

func Roll(dice:(Int,Int))->Int{
    var result: Int;
    for _ in 1...dice.0{
        result += Int(arc4random_uniform(UInt32(dice.1))+1);
    }
    return result;
}
