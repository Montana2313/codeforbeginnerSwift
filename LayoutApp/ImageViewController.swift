//
//  ImageViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    var situation  = false
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Image.isUserInteractionEnabled = true
        
        let gestureReco = UITapGestureRecognizer(target: self, action: #selector(ImageViewController.change_picture))
        Image.addGestureRecognizer(gestureReco)
        
    }
    @objc func change_picture()
    {
        if(situation == false)
        {
            Image.image =   UIImage(named:"mustang.jpg")
            situation = true
        }
        else if (situation == true)
        {
            Image.image = UIImage(named: "zgr.jpg")
            situation = false
        }
    }
    @IBAction func ChangeButton(_ sender: Any) {
        
        if(situation == false)
        {
            Image.image =   UIImage(named:"mustang.jpg")
            situation = true
        }
        else if (situation == true)
        {
            Image.image = UIImage(named: "zgr.jpg")
            situation = false
        }
    }
    
}
