//
//  globals.swift
//  DND_Char_Sheet
//
//  Some useful global variables that are here for ease of access
//
//  Created by Josh Freedman on 3/4/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit

// this is for loading and storing all of the characters for any given
var characters = [Character]()


// this is the characterToBeAdded struct
struct charToBeAdded{
    var name: String?
    var clss: String?
    var race: String?
    var str: Int?
    var dex: Int?
    var con: Int?
    var wis: Int?
    var cha: Int?
    var int: Int?
}
var CharToBeAdded = charToBeAdded()

// global variable that stores the current character
var currentCharacter: Character!
