//
//  Classes.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/5/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation

class Race{
    var str,dex,con,int,wis,cha: Int;
    init(){
        str=0;dex=0;con=0;int=0;wis=0;cha=0;
    }
}

class MountainDwarf: Race{
    init(){
        super.init()
        con=2;str=2
    }
}
class HillDwarf: Race{
    init(){
        super.init()
        con=2;wis=1
    }
}
class HighElf: Race{
    init(){
        super.init()
        dex=2;int=1
    }
}
class DarkElf: Race{
    init(){
        super.init()
        dex=2;cha=1
    }
}
class LightfootHalfling: Race{
    init(){
        super.init()
        dex=2;cha=1
    }
}
class StoutHalfling: Race{
    init(){
        super.init()
        dex=2;con=1
    }
}
class Human: Race{
    init(){
        super.init()
        str+=1;dex+=1;con+=1;int+=1;wis+=1;cha+=1;
    }
}
class Dragonborn: Race{
    init(){
        super.init()
        str=2;cha=1
    }
}
class ForestGnome: Race{
    init(){
        super.init()
        int=2;dex=1
    }
}
class RockGnome: Race{
    init(){
        super.init()
        int=2;con=1
    }
}
class HalfElf: Race{
    init(){
        super.init()
        cha=2;
    }
}
class HalfOrc: Race{
    init(){
        super.init()
        str=2;con=1
    }
}
class Tiefling: Race{
    init(){
        super.init()
        int=1;cha=2
    }
}
