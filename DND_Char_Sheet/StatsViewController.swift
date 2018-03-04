//
//  StatsViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/4/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit
import os.log

class StatsViewController: UIViewController {
    
    // this is for loading
    var characters = [Character]()
    
    @IBOutlet weak var strengthField: UITextField!
    @IBOutlet weak var dexterityField: UITextField!
    @IBOutlet weak var constitutionField: UITextField!
    @IBOutlet weak var intelligenceField: UITextField!
    @IBOutlet weak var wisdomField: UITextField!
    @IBOutlet weak var charismaField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.view.backgroundColor = .clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeStatsPressed(_ sender: Any) {
        // run the save functionality for the newly created character
        // ALSO this does not do much error checking, so later, please fix this
        /*CharToBeAdded.str =
        CharToBeAdded.int =
        CharToBeAdded.cha =
        CharToBeAdded.con =
        CharToBeAdded.wis =
        CharToBeAdded.dex =
        */
        
        performSegue(withIdentifier: "toMain", sender: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: adding save/load functionality
    
    private func saveCharacters() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(characters, toFile: Character.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Characters successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save characters...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadCharacters() -> [Character]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Character.ArchiveURL.path) as? [Character]
    }
}
