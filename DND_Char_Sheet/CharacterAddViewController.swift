//
//  CharacterAddViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit
import os.log

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

class CharacterAddViewController: UIViewController{
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var classField: UITextField!
    @IBOutlet weak var raceField: UITextField!
    
    let classes = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    let races = ["Hill Darf", "Mountain Dwarf", "High Elf", "Dark Elf", "Lightfoot Halfling", "Human", "Dragonborn", "Forest Gnome", "Rock Gnome", "Half-Elf", "Half-Orc", "Tiefling"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewWillDisappear(true)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.view.backgroundColor = .clear
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createPressed(_ sender: Any) {
        let characterName = nameField.text
        let characterClass = classField.text
        let characterRace = raceField.text
        var classExists = false
        var raceExists = false
        
        if ((characterName != nil) && (characterClass != nil) && (characterRace != nil)) {
            for className in classes {
                if className.lowercased() == characterClass?.lowercased() {
                    classExists = true
                }
            }
            for raceName in races {
                if raceName.lowercased() == characterRace?.lowercased() {
                    raceExists = true
                }
            }
        }
        if classExists && raceExists {
            CharToBeAdded.name = characterName
            CharToBeAdded.clss = characterClass
            CharToBeAdded.race = characterRace
            self.performSegue(withIdentifier: "makeStats", sender: nil)
        }
        else {
            print(classExists)
            print(raceExists)
            print("invalid")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
