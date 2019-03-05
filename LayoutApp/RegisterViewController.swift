//
//  RegisterViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SaveButton(_ sender: Any) {
        if passwordText.text == "" || passwordAgainText.text == "" || usernameText.text == ""
        {
            throwAlert(alert: "There are empty place.")
        }
        else
        {
            if passwordText.text != passwordAgainText.text
            {
                throwAlert(alert: "Passwords are not matchable !!")
            }
            else {
                throwAlert(alert: "Has been saved succesfully")
            }
        }
        
        
        
        
    }
    func throwAlert(alert: String){
        
        let alert = UIAlertController(title: "Hata", message: alert, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        
        self.present(alert,animated: true , completion: nil)
    }
    

}
