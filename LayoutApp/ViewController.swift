//
//  ViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var BirthDayInput: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BirthDayLabel: UILabel!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let storedName = UserDefaults.standard.object(forKey: "namestring")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthdaystring")
        
        if let NewName = storedName as? String {
            NameLabel.text = "Name : \(NewName)"
        }
        if let NewBirthDayDate = storedBirthday as? String {
            BirthDayLabel.text = "Birthday : \(NewBirthDayDate)"
        }
        
        
    }

    @IBAction func SaveButtonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(NameInput.text!, forKey: "namestring")
        UserDefaults.standard.set(BirthDayInput.text!, forKey: "birthdaystring")
        UserDefaults.standard.synchronize() //
        
        NameLabel.text = "Name : \(NameInput.text!)"
        BirthDayLabel.text = "Birthday : \(BirthDayInput.text!)"
        username = NameLabel.text!
        
        // segue bölümü
        performSegue(withIdentifier: "showSecond", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond"
        {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.name = username
        }
    }
    @IBAction func DeleteButtonClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "namestring")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthdaystring")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "namestring")
            UserDefaults.standard.synchronize()
            
            NameLabel.text = "Name : "
        }
        if(storedBirthday as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "birthdaystring")
            UserDefaults.standard.synchronize()
            
            BirthDayLabel.text = "BirthDay : "
        }
        
        
        
        
        
    }
    
}

