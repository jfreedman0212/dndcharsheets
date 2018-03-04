//
//  MainViewController.swift
//  DND_Char_Sheet
//
//  Created by T on 3/3/18.
//  Copyright © 2018 Josh Freedman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var characterButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if loadCharacters() != nil {
            characters = loadCharacters()!
            for char in characters {
                // this is where the loading of the buttons will go
                
                
            }
        }

        // Do any additional setup after loading the view.
        viewWillAppear(false)
        
        let xConst = 41.0
        let yInit = 94.0
        scrollView.contentSize = CGSize(width: 294, height: 444 + ((Double(characters.count) - 8) * 55.5))
        for index in 0...characters.count - 1 {
            let button = UIButton(frame: CGRect(x: xConst, y: yInit + (Double(index) * 55.5), width: 294.0, height: 55.5))
                scrollView.addSubview(button)
        }
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
