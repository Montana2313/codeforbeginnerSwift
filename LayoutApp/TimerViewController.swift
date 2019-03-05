//
//  TimerViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var TextAreaTimer: UITextField!
    @IBOutlet weak var LabelTimer: UILabel!
    var timer = Timer()
    var counter = 0
    var countofend = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func StartButton(_ sender: Any) {
        
        if TextAreaTimer.text != ""
        {
            countofend = Int(TextAreaTimer.text!)! // kaça kadar ?
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.repeatfunc), userInfo: nil, repeats: true)
            
        }
        else
        {
            
            let alert = UIAlertController(title: "Hata", message: "Boş alan bırakmayız", preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okbutton)
            
            self.present(alert,animated: true,completion: nil)
        }
        
    }
    @objc func repeatfunc()
    {
        LabelTimer.text = String(counter)
        counter = counter + 1
        
        if(counter > countofend)
        {
            timer.invalidate()
            counter = 0 
            LabelTimer.text = "Timer's off"
        }
    }
    
}
