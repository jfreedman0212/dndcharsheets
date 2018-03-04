//
//  CharacterViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/4/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit
import os.log

class CharacterViewController: UIViewController {

    @IBOutlet weak var nameVal: UILabel!
    @IBOutlet weak var classVal: UILabel!
    @IBOutlet weak var raceVal: UILabel!
    
    @IBOutlet weak var strengthVal: UILabel!
    @IBOutlet weak var dexterityVal: UILabel!
    @IBOutlet weak var constitutionVal: UILabel!
    @IBOutlet weak var intelligenceVal: UILabel!
    @IBOutlet weak var wisdomVal: UILabel!
    @IBOutlet weak var charismaVal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(true)
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.view.backgroundColor = .clear
        
        nameVal.text = currentCharacter.name.capitalized
        classVal.text = currentCharacter.clss.capitalized
        raceVal.text = currentCharacter.race.capitalized
        
        strengthVal.text = String(currentCharacter.str)
        dexterityVal.text = String(currentCharacter.dex)
        constitutionVal.text = String(currentCharacter.con)
        intelligenceVal.text = String(currentCharacter.int)
        wisdomVal.text = String(currentCharacter.wis)
        charismaVal.text = String(currentCharacter.cha)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func strengthDecrement(_ sender: Any) {
        if currentCharacter.str > 0 {
            currentCharacter.str -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].str = currentCharacter.str
            saveCharacters()
            strengthVal.text = String(currentCharacter.str)
        }
    }
    @IBAction func dexterityDecrement(_ sender: Any) {
        if currentCharacter.dex > 0 {
            currentCharacter.dex -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].dex = currentCharacter.dex
            saveCharacters()
            dexterityVal.text = String(currentCharacter.dex)
        }
    }
    @IBAction func constitutionDecrement(_ sender: Any) {
        if currentCharacter.con > 0 {
            currentCharacter.con -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].con = currentCharacter.con
            saveCharacters()
            constitutionVal.text = String(currentCharacter.con)
        }
    }
    @IBAction func intelligenceDecrement(_ sender: Any) {
        if currentCharacter.int > 0 {
            currentCharacter.int -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].int = currentCharacter.int
            saveCharacters()
            intelligenceVal.text = String(currentCharacter.int)
        }
    }
    @IBAction func wisdomDecrement(_ sender: Any) {
        if currentCharacter.wis > 0 {
            currentCharacter.wis -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].wis = currentCharacter.wis
            saveCharacters()
            wisdomVal.text = String(currentCharacter.wis)
        }
    }
    @IBAction func charismaDecrement(_ sender: Any) {
        if currentCharacter.cha > 0 {
            currentCharacter.cha -= 1
            let index = characters.index(of: currentCharacter)
            characters[index!].cha = currentCharacter.cha
            saveCharacters()
            charismaVal.text = String(currentCharacter.cha)
        }
    }
    
    
    
    
    @IBAction func strengthIncrement(_ sender: Any) {
        if currentCharacter.str < 20 {
            currentCharacter.str += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].str = currentCharacter.str
            saveCharacters()
            strengthVal.text = String(currentCharacter.str)
        }
    }
    @IBAction func dexterityIncrement(_ sender: Any) {
        if currentCharacter.dex < 20 {
            currentCharacter.dex += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].dex = currentCharacter.dex
            saveCharacters()
            dexterityVal.text = String(currentCharacter.dex)
        }
    }
    @IBAction func constitutionIncrement(_ sender: Any) {
        if currentCharacter.con < 20 {
            currentCharacter.con += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].con = currentCharacter.con
            saveCharacters()
            constitutionVal.text = String(currentCharacter.con)
        }
    }
    @IBAction func intelligenceIncrement(_ sender: Any) {
        if currentCharacter.int < 20 {
            currentCharacter.int += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].int = currentCharacter.int
            saveCharacters()
            intelligenceVal.text = String(currentCharacter.int)
        }
    }
    @IBAction func wisdomIncrement(_ sender: Any) {
        if currentCharacter.wis < 20 {
            currentCharacter.wis += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].wis = currentCharacter.wis
            saveCharacters()
            wisdomVal.text = String(currentCharacter.wis)
        }
    }
    @IBAction func charismaIncrement(_ sender: Any) {
        if currentCharacter.cha < 20 {
            currentCharacter.cha += 1
            let index = characters.index(of: currentCharacter)
            characters[index!].cha =  currentCharacter.cha
            saveCharacters()
            charismaVal.text = String(currentCharacter.cha)
        }
    }
    
    
    
    
    @IBAction func strengthRoll(_ sender: Any) {
        
    }
    @IBAction func dexterityRoll(_ sender: Any) {
        
    }
    @IBAction func constitutionRoll(_ sender: Any) {
        
    }
    @IBAction func intelligenceRoll(_ sender: Any) {
        
    }
    @IBAction func wisdomRoll(_ sender: Any) {
        
    }
    @IBAction func charismaRoll(_ sender: Any) {
        
    }
    
    private func saveCharacters() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(characters, toFile: Character.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Characters successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save characters...", log: OSLog.default, type: .error)
        }
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
