//
//  CharacterViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/4/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit
// global variable that stores the current character
var currentCharacter: Character!

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

        // Do any additional setup after loading the view.
        nameVal.text = currentCharacter.name
        classVal.text = currentCharacter.clss
        raceVal.text = currentCharacter.race
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func strengthDecrement(_ sender: Any) {
        
    }
    @IBAction func dexterityDecrement(_ sender: Any) {
        
    }
    @IBAction func constitutionDecrement(_ sender: Any) {
        
    }
    @IBAction func intelligenceDecrement(_ sender: Any) {
        
    }
    @IBAction func wisdomDecrement(_ sender: Any) {
        
    }
    @IBAction func charismaDecrement(_ sender: Any) {
        
    }
    
    
    
    
    @IBAction func strengthIncrement(_ sender: Any) {
        
    }
    @IBAction func dexterityIncrement(_ sender: Any) {
        
    }
    @IBAction func constitutionIncrement(_ sender: Any) {
        
    }
    @IBAction func intelligenceIncrement(_ sender: Any) {
        
    }
    @IBAction func wisdomIncrement(_ sender: Any) {
        
    }
    @IBAction func charismaIncrement(_ sender: Any) {
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
