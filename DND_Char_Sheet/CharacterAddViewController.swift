//
//  CharacterAddViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit
import os.log

class CharacterAddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var classButton: UIButton!
    @IBOutlet weak var rankButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    var classes: [String] = [String]()
    var races: [String] = [String]()
    var classesSelected = false
    var racesSelected = false
    
    // this is for loading
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewWillDisappear(true)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.view.backgroundColor = .clear

        toolbar.backgroundColor = .clear
        
        classes = ["select class", "Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
        races = ["select rank", "Hill Darf", "Mountain Dwarf", "High Elf", "Dark Elf", "Lightfoot Halfling", "Human", "Dragonborn", "Forest Gnome", "Rock Gnome", "Half-Elf", "Half-Orc", "Tiefling"]
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        pickerView.isOpaque = false
        pickerView.alpha = 0.3
        pickerView.isHidden = true
        view.addSubview(pickerView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        if pickerView.isHidden {
            createButton.isHidden = true
        }
    }
    
    @objc func donePicker(_ sender: UIBarButtonItem) {
        pickerView.isHidden = true
        classesSelected = false
        racesSelected = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func classPickerPressed(_ sender: UIButton) {
        classesSelected = true
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
    }
    
    @IBAction func rankPickerPressed(_ sender: UIButton) {
        racesSelected = true
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if classesSelected {
            return classes.count
        }
        return races.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if classesSelected {
            return classes[row]
        }
        return races[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if classesSelected {
            classButton.setTitle(classes[row], for: .normal)
        }
        classButton.setTitle(races[row], for: .normal)
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
