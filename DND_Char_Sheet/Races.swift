//
//  Classes.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/5/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//
//let thing = NSStringFromClass(Race.self);

import Foundation

@objc(Race)
class Race: NSObject{
    var str,dex,con,int,wis,cha: Int;
    required override init(){
        str=0;dex=0;con=0;int=0;wis=0;cha=0;
    }
    
    func GetStr() -> Int{
        return str;
    }
    func GetDex() -> Int{
        return dex
    }
    func GetCon() -> Int{
        return con
    }
    func GetInt() -> Int{
        return int
    }
    func GetWis() -> Int{
        return wis;
    }
    func GetCha() -> Int{
        return cha;
    }
}

class MountainDwarf: Race{
    required init(){
        super.init()
        con=2;str=2
    }
}
class HillDwarf: Race{
    required init(){
        super.init()
        con=2;wis=1
    }
}
class HighElf: Race{
    required init(){
        super.init()
        dex=2;int=1
    }
}
class DarkElf: Race{
    required init(){
        super.init()
        dex=2;cha=1
    }
}
class LightfootHalfling: Race{
    required init(){
        super.init()
        dex=2;cha=1
    }
}
class StoutHalfling: Race{
    required init(){
        super.init()
        dex=2;con=1
    }
}
class Human: Race{
    required init(){
        super.init()
        str+=1;dex+=1;con+=1;int+=1;wis+=1;cha+=1;
    }
}
class Dragonborn: Race{
    required init(){
        super.init()
        str=2;cha=1
    }
}
class ForestGnome: Race{
    required init(){
        super.init()
        int=2;dex=1
    }
}
class RockGnome: Race{
    required init(){
        super.init()
        int=2;con=1
    }
}
class HalfElf: Race{
    required init(){
        super.init()
        cha=2
    }
}
class HalfOrc: Race{
    required init(){
        super.init()
        str=2;con=1
    }
}
class Tiefling: Race{
    required init(){
        super.init()
        int=1;cha=2
    }
}



