//
//  Character.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit
import os.log

// Character class for holding character data
class Character: NSObject,NSCoding{
    var str,dex,con,int,wis,cha: Int;
    var clss,race,name: String;
    var hit_dice,max_hit_dice: (Int,Int);
    
    init(s: Int,d: Int,c: Int,i: Int,w: Int,ch: Int,cl: String,r: String,n: String,extra: String = "",extra2: String = "") {
        str=s;dex=d;con=c;int=i;wis=w;cha=ch;
        clss = cl; race = r;name = n;
        
        
        
        
        if cl == "Bard" || cl == "Cleric" || cl == "Druid" || cl == "Monk" || cl == "Rogue" || cl == "Warlock" {
            hit_dice=(1,8);
        }
        else if (cl == "Sorcerer" || cl == "Wizard"){
            hit_dice=(1,6);
        }
        else if(cl == "Barbarian"){
            hit_dice=(1,12);
        }
        else{
            hit_dice=(1,10);
        }
        max_hit_dice = hit_dice;
    }
    
    func GetAbility(a: String) -> Int{
        var result: Int;
        switch(a){
        case "Strength":
            result = str;
            break
        case "Dexterity":
            result = dex;
            break
        case "Constitution":
            result = con;
            break
        case "Intelligence":
            result = int
            break
        case "Wisdom":
            result = wis;
            break
        case "Charisma":
            result = cha;
            break
        default:
            result = str;
            break
        }
        return result;
    }
    
    func GetModifier(a: String) -> Int{
        var result: Int;
        switch(a){
        case "Strength":
            result = str;
            break
        case "Dexterity":
            result = dex;
            break
        case "Constitution":
            result = con;
            break
        case "Intelligence":
            result = int
            break
        case "Wisdom":
            result = wis;
            break
        case "Charisma":
            result = cha;
            break
        default:
            result = str;
            break
        }
        result = (result - 10)/2;
        return result;
    }
    
    func GetProperty(a: String) -> String{
        var result: String;
        switch(a){
        case "Name":
            result=name;
            break
        case "Race":
            result=race;
            break
        case "Class":
            result=clss;
            break
        default:
            result=name;
            break;
        }
        return result;
    }
    
    func GetHitDice() -> (Int,Int){
        return hit_dice;
    }
    func DisplayHitDice() -> String {
        let result = "\(hit_dice.0)d\(hit_dice.1)";
        return result;
    }
    func GetMaxHitDice() -> (Int,Int){
        return max_hit_dice;
    }
    func DisplayMaxHitDice() -> String {
        let result = "\(max_hit_dice.0)d\(max_hit_dice.1)";
        return result;
    }
    
    func IncAbility(a: String){
        switch(a){
        case "Strength":
            str+=1;
            break
        case "Dexterity":
            dex+=1;
            break
        case "Constitution":
            con+=1;
            break
        case "Intelligence":
            int+=1;
            break
        case "Wisdom":
            wis+=1;
            break
        case "Charisma":
            cha+=1;
            break
        default:
            str+=1;
            break
        }
    }
    func DecAbility(a: String){
        switch(a){
        case "Strength":
            str-=1;
            break
        case "Dexterity":
            dex-=1;
            break
        case "Constitution":
            con-=1;
            break
        case "Intelligence":
            int-=1;
            break
        case "Wisdom":
            wis-=1;
            break
        case "Charisma":
            cha-=1;
            break
        default:
            str-=1;
            break
        }
    }
    func IncHitDice(){
        if max_hit_dice == hit_dice{
            max_hit_dice.0 += 1;
            hit_dice.0 += 1;
        }
        else {
            max_hit_dice.0 += 1;
        }
    }
    func DecHitDice(){
        if max_hit_dice == hit_dice{
            if max_hit_dice.0 > 0{
                max_hit_dice.0 -= 1;
            }
            if hit_dice.0 > 0 {
                hit_dice.0 -= 1;
            }
        }
        else{
            if max_hit_dice.0 > 0{
                max_hit_dice.0 -= 1;
            }
        }
    }
    func UseHitDice(num: Int) -> Int{
        let temp_dice = hit_dice;
        hit_dice.0 -= num;
        return Roll(dice:(num,temp_dice.1));
    }
    func RefreshHitDice(){
        hit_dice = max_hit_dice;
    }
    
    // MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let clss = "clss"
        static let race = "race"
        static let str = "str"
        static let dex = "dex"
        static let con = "con"
        static let int = "int"
        static let wis = "wis"
        static let cha = "cha"
        static let hit_dice = "hit_dice"
        static let max_hit_dice = "max_hit_dice"
    }
    
    // MARK: NSCoding stuff
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(clss, forKey: PropertyKey.clss)
        aCoder.encode(race, forKey: PropertyKey.race)
        aCoder.encode(str, forKey: PropertyKey.str)
        aCoder.encode(dex, forKey: PropertyKey.dex)
        aCoder.encode(con, forKey: PropertyKey.con)
        aCoder.encode(int, forKey: PropertyKey.int)
        aCoder.encode(wis, forKey: PropertyKey.wis)
        aCoder.encode(cha, forKey: PropertyKey.cha)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let n = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Character object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // initializing the rest of the member variables
        let clss = aDecoder.decodeObject(forKey: PropertyKey.clss)
        let race = aDecoder.decodeObject(forKey: PropertyKey.race)
        let str = aDecoder.decodeInteger(forKey: PropertyKey.str)
        let dex = aDecoder.decodeInteger(forKey: PropertyKey.dex)
        let con = aDecoder.decodeInteger(forKey: PropertyKey.con)
        let int = aDecoder.decodeInteger(forKey: PropertyKey.int)
        let cha = aDecoder.decodeInteger(forKey: PropertyKey.cha)
        let wis = aDecoder.decodeInteger(forKey: PropertyKey.wis)
        
        
        self.init(s: str , d: dex , c: con , i: int , w: wis, ch: cha, cl: clss as! String, r: race as! String, n: n)
    }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("saved_characters")
}

