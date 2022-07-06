//
//  ViewController.swift
//  Discount
//
//  Created by Victor Mashukevich on 1.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var buttonOut: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var restoreLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    var timer: Timer!
    let interval: TimeInterval = 4155

    let formatter = DateComponentsFormatter()
   
    
//    Text Labels
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var subtitleLabels: UILabel!
    @IBOutlet weak var subtitleLabels2: UILabel!
//    Views
  
    
    @IBOutlet weak var secondsView: UIView!
    
    @IBOutlet weak var minuteView: UIView!
    
    @IBOutlet weak var hourView: UIView!

    @IBOutlet weak var dayView: UIView!
    
    
    var images: UIImage!
    
    // Timer leble
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    var count = 86400
    override func viewDidLoad() {
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [
            .hour,
            .minute,
            .second
    
        ]
        
         
        timerFunc()
        setupLabels()
        setupGradientButton()
        
        super.viewDidLoad()
    }
    
    func timerFunc(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
      
           timer.fire()
    }
    func setupGradientButton(){
        let gradient = CAGradientLayer()
          let colorTop = UIColor(red: 165/255.0, green: 69/255.0, blue: 152/255.0, alpha: 1).cgColor
          let colorBottom = UIColor(red: 0  , green: 0 , blue: 187/255.0, alpha: 1).cgColor
          gradient.colors = [colorTop,colorBottom]
          gradient.locations = [0,1]
          gradient.frame = buttonOut.bounds
          buttonOut.layer.addSublayer(gradient)
    }
    
    @IBAction func offerAccepted(_ sender: Any) {
        alert()
    }
    func alert(){
        let Timeactivate = TimeInterval(count)
        let activateTime = formatter.string(from: Timeactivate)
        timer.invalidate()
        let alert = UIAlertController(title: "Great!", message: "Offer activated at \(activateTime ?? "yes")" , preferredStyle: .alert)
    
        present(alert, animated: true)
        
    }
    func timerStop(){
        
    }
    func setupLabels(){
       // Text labels
        topLable.text = """
           LAST-MINUTE CHANCE!
            to claim your offer
    """
        topLable.textColor = UIColor.white
        
        middleLabel.text = "90% OFF"
        middleLabel.textColor = UIColor.white
        
        subtitleLabels.text = "For true music fun"
        subtitleLabels.textColor = UIColor.white
      
        subtitleLabels2.text = "Hundreds of songs in your pocket"
        subtitleLabels2.alpha = 0.6
        subtitleLabels2.textColor = UIColor.white
        
        termsLabel.text = "Terms"
        
        restoreLabel.text = "Restore"
        
        privacyLabel.text = "Privacy"

        buttonOut.setTitle("ACTIVATE OFFER", for: .normal)
        
    
//       images
        images = UIImage(named: "music")
        image.image = images
        image.contentMode = .scaleToFill
        
     // layers
        secondsView.layer.cornerRadius = 8
        secondsLabel.layer.cornerRadius = 8
        secondsLabel.layer.masksToBounds = true
        
        minuteView.layer.cornerRadius = 8
        minuteLabel.layer.cornerRadius = 8
        minuteLabel.layer.masksToBounds = true
        
        
        hourView.layer.cornerRadius = 8
        hourLabel.layer.cornerRadius = 8
        hourLabel.layer.masksToBounds = true
        
        
        dayView.layer.cornerRadius = 8
        dayLabel.layer.cornerRadius = 8
        dayLabel.layer.masksToBounds = true
   
        
        buttonOut.layer.cornerRadius = 12
        buttonOut.layer.masksToBounds = true
        
        termsLabel.textColor = UIColor.white
        termsLabel.alpha = 0.6
        
        restoreLabel.textColor = UIColor.white
        restoreLabel.alpha = 0.6
        
        privacyLabel.textColor = UIColor.white
        privacyLabel.alpha = 0.6
     
        
        
        view.backgroundColor = UIColor.black
    }
    
    @objc func printTime()
    {

        if(count > 0){

            let seconds = count % 60
            let minutes = (count / 60) % 60
            let hours = count / 3600
            let day = count / 86400
            let strDays = day > 9 ? String(day) : "0" + String(day)
            let strHours = hours > 9 ? String(hours) : "0" + String(hours)
            let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
            let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
                    secondsLabel.text = "\(strSeconds)"
            if let aLabel = secondsLabel  {
               
             
                aLabel.pushTransition(0.9)
                       aLabel.text = "\(strSeconds)"
                
                   }
            if let minuteLabel = minuteLabel, strSeconds == "00" {
                minuteLabel.pushTransition(0.9)
                minuteLabel.text = "\(strMinutes )"
                
            }
            if let hoursLabel = hourLabel , strMinutes == "00" && strSeconds == "00"{
                hoursLabel.pushTransition(0.9)
                hoursLabel.text = "\(strHours)"
            }
            if let daysLabel = dayLabel , strHours == "00" && ((count / 3600) != 0) {
                daysLabel.pushTransition(0.9)
                daysLabel.text = "\(strDays)"
            }
            minuteLabel.text = "\(strMinutes)"
            hourLabel.text = "\(strHours)"
            dayLabel.text = "\(strDays)"
         
            count -= 1
        }
        
    }
    
}
extension UIView {
    func pushTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: "kCATransitionPush")
    }
  
    }

