//
//  SecondViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        NameLabel.text = "Name is \(name)"
    }
    @IBAction func BacktoButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ButtonAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Hata", message: "Eksik Bilgileri var ", preferredStyle: UIAlertController.Style.alert)
        
        let okbutton = UIAlertAction(title: "Tamam", style : UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okbutton)
        
         self.present(alert,animated: true , completion: nil)
    }
    
}
