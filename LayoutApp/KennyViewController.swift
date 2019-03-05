//
//  KennyViewController.swift
//  LayoutApp
//
//  Created by Özgür  Elmaslı on 4.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit

class KennyViewController: UIViewController {

    @IBOutlet weak var HighScoreLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var zgr1: UIImageView!
    @IBOutlet weak var zgr2: UIImageView!
    @IBOutlet weak var zgr3: UIImageView!
    @IBOutlet weak var zgr4: UIImageView!
    @IBOutlet weak var zgr5: UIImageView!
    @IBOutlet weak var zgr6: UIImageView!
    @IBOutlet weak var zgr7: UIImageView!
    @IBOutlet weak var zgr: UIImageView!
    @IBOutlet weak var zgr9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var timerofimage = Timer()
    var counter = 30
    var keephighScore = 0
    var arrayofImage = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         control_high_score()
         setTimer()
         setAllReco()
         append_all_images()
         hide_items()
    }
    @objc func  increaseScore() {
        
        score += 1
        
        ScoreLabel.text = "Score : \(score)"
        ScoreLabel.textColor = UIColor.blue
    }
    func selam()
    {
        print("selam")
    }
    func setTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(KennyViewController.timerdurum), userInfo: nil, repeats: true)
        timerofimage = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(KennyViewController.hide_items), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerdurum()
    {
        counter  = counter - 1
        TimerLabel.text = "Timer : \(counter) seconds"
        if(counter == 0 )
        {
            self.timer.invalidate()
            self.timerofimage.invalidate()
            TimerLabel.text = "Time is over"
            ScoreLabel.text = "Your Score is \(score)"
            
            if self.score > keephighScore
            {
                UserDefaults.standard.set(self.score, forKey: "highscore")
                HighScoreLabel.text = "En Yüksek Skorunuz : \(String(self.score))"
                UserDefaults.standard.synchronize()
            }
            hide_all()
            
            let alert = UIAlertController(title: "Tebrikler", message: "Güzel İş Çıkardın !", preferredStyle:UIAlertController.Style.alert)
            let okbutton = UIAlertAction(title: "Sağol", style: UIAlertAction.Style.default, handler: nil)
            let replaybutton = UIAlertAction(title: "Tekrar Oynayalım!", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.score = 0
                self.counter = 30
                self.setTimer()
                self.hide_items()
            }
            alert.addAction(okbutton)
            alert.addAction(replaybutton)
            
            self.present(alert,animated: true,completion: nil)
            
            
            
            
        }
        
    }
    func control_high_score()
    {
        let highscore = UserDefaults.standard.object(forKey: "highscore")
        if highscore == nil
        {
            HighScoreLabel.text = "\(keephighScore)"
        }
        if let newscore = highscore as? Int
        {
            keephighScore = newscore
            HighScoreLabel.text = "En Yüksek Skorunuz Bu => : \(String(newscore))"
        }
    }
    func hide_all()
    {
        for item in arrayofImage
        {
            item.isHidden = true
        }
    }
    func append_all_images()
    {
        arrayofImage.append(zgr)
        arrayofImage.append(zgr1)
        arrayofImage.append(zgr2)
        arrayofImage.append(zgr3)
        arrayofImage.append(zgr4)
        arrayofImage.append(zgr5)
        arrayofImage.append(zgr6)
        arrayofImage.append(zgr7)
        arrayofImage.append(zgr9)
    }
    @objc func hide_items()
    {
        if(arrayofImage.count > 0)
        {
            hide_all()
            let random = Int(arc4random_uniform(UInt32(arrayofImage.count)))
        
            arrayofImage[random].isHidden = false
        }
    }
    
    func setAllReco()
    {
        let recognaizer1 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer2 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer3 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer4 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer5 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer6 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer7 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer8 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        let recognaizer9 = UITapGestureRecognizer(target: self, action: #selector(KennyViewController.increaseScore))
        
        zgr1.isUserInteractionEnabled = true
        zgr2.isUserInteractionEnabled = true
        zgr3.isUserInteractionEnabled = true
        zgr4.isUserInteractionEnabled = true
        zgr5.isUserInteractionEnabled = true
        zgr6.isUserInteractionEnabled = true
        zgr7.isUserInteractionEnabled = true
        zgr.isUserInteractionEnabled = true
        zgr9.isUserInteractionEnabled = true
        
        zgr1.addGestureRecognizer(recognaizer1)
        zgr2.addGestureRecognizer(recognaizer2)
        zgr3.addGestureRecognizer(recognaizer3)
        zgr4.addGestureRecognizer(recognaizer4)
        zgr5.addGestureRecognizer(recognaizer5)
        zgr6.addGestureRecognizer(recognaizer6)
        zgr7.addGestureRecognizer(recognaizer7)
        zgr.addGestureRecognizer(recognaizer8)
        zgr9.addGestureRecognizer(recognaizer9)
    }
 

}
