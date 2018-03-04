//
//  MainViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit

// global variable that stores the current character
var currentCharacter: Character!

class MainViewController: UIViewController {
    
    //GetProperty(String: a)
    
    @IBOutlet weak var scrollView: UIScrollView!
    var characterButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewWillAppear(false)
        viewDidAppear(true)
    
        }
    
    override func viewDidAppear(_ animated: Bool) {
        let xConst = 100.0
        let yInit = 10.0
        scrollView.contentSize = CGSize(width: 294, height: 444 + ((Double(characters.count) - 8) * 55.5))
        if characters.count > 0 {
            for index in 0...characters.count - 1 {
                let yLocation = yInit + (Double(index) * 55.5)
                let button = UIButton(frame: CGRect(x: xConst, y: yLocation, width: 97.0, height: 55.5))
                button.setTitle(characters[index].GetProperty(a: "name"), for: .normal)
                button.setTitleColor(UIColor.black, for: .normal)
                button.setTitleColor(UIColor.black, for: .highlighted)
                button.titleLabel?.font = UIFont(name: "Dungeon", size: 34)
                button.backgroundColor = .clear
                button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
                button.addTarget(self, action: #selector(charButton(sender:)), for: UIControlEvents.touchUpInside)
                characterButtons[index] = button
                scrollView.addSubview(button)
            }
        }
    }
    
    @objc func charButton(sender: UIButton!) {
        performSegue(withIdentifier: "toCharacter", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func addCharacter(_ sender: Any) {
        self.performSegue(withIdentifier: "addCharacter", sender: nil)
    }
    
    
    private func loadCharacters() -> [Character]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Character.ArchiveURL.path) as? [Character]
    }

}
