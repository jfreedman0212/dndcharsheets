//
//  Character.swift
//  DND_Char_Sheet
//
//  Created by Justin Marquez on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import Foundation
import UIKit

// MARK: Types
struct PropertyKey {
    static let name = "name"
    static let clss = "clss"
    static let race = "race"
    static let str = "str"
    static let dex = "dex"
    static let con = "con"
    static let int = "int"
}

// Character class for holding character data
class Character{
    var str,dex,con,int,wis,cha: Int;
    var clss,race,name: String;
    var hit_dice: (Int,Int);
    var lvl: Int;
    
    init(s: Int,d: Int,c: Int,i: Int,w: Int,ch: Int,cl: String,r: String,n: String, extra: String = "",extra2: String = "") {
        lvl=1;
        str=s;dex=d;con=c;int=i;wis=w;cha=ch;
        clss = cl; race = r;name = n;
        switch(r){
        case "Hill Dwarf":
            con+=2;wis+=1;
            break
        case "Mountain Dwarf":
            con+=2;str+=2;
            break
        case "High Elf":
            dex+=2;int+=1;
            break
        case "Dark Elf":
            dex+=2;cha+=1;
            break
        case "Lightfoot Halfling":
            dex+=2;cha+=1;
            break
        case "Stout Halfling":
            dex+=2;con+=1;
            break
        case "Human":
            str+=1;dex+=1;con+=1;int+=1;wis+=1;cha+=1;
            break
        case "Dragonborn":
            str+=2;cha+=1;
            break
        case "Forest Gnome":
            int+=2;dex+=1;
            break
        case "Rock Gnome":
            int+=2;con+=1;
            break
        case "Half-Elf":
            cha+=2;
            if extra != "" && extra2 != "" {
                switch extra{
                case "Strength":
                    str+=1;
                    break
                case "Dexterity":
                    dex+=1;break
                case "Constitution":
                    con+=1;break
                case "Intelligence":
                    int+=1;break
                case "Wisdom":
                    wis+=1;break
                case "Charisma":
                    cha+=1;break
                default:
                    break
                }
                switch extra2{
                case "Strength":
                    str+=1;
                    break
                case "Dexterity":
                    dex+=1;break
                case "Constitution":
                    con+=1;break
                case "Intelligence":
                    int+=1;break
                case "Wisdom":
                    wis+=1;break
                case "Charisma":
                    cha+=1;break
                default:
                    break
                }
            }
            break
        case "Half-Orc":
            str+=2;con+=1;
            break
        case "Tiefling":
            int+=1;cha+=2;
            break
        default:
            break
        }
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
    func GetLevel() -> Int{
        return lvl;
    }
    
    func IncAbility(a: String){
        switch(a){
        case "Strength":
            str+=1;
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
    func IncLevel(){
        lvl+=1;
        hit_dice=(lvl,hit_dice.1);
    }
    func DecLevel(){
        lvl-=1;
        hit_dice=(lvl,hit_dice.1);
    }
}


