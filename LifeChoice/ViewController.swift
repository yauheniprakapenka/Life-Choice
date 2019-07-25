//
//  ViewController.swift
//  LifeChoice
//
//  Created by yauheni prakapenka on 20/07/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var previousChoice = Choice.sleep
    var currentChoice = Choice.sleep
    
    let motionEffect = MotionEffect()
    let animation = Animation()
    
    var catSprites: [UIImage] = []
    var zzzSprites: [UIImage] = []
    var cloudSprites: [UIImage] = []
    
    @IBOutlet weak var backgroundColorImageView: UIImageView!
    
    @IBOutlet weak var socialLifeColorImageView: UIImageView!
    @IBOutlet weak var sleepColorImageView: UIImageView!
    @IBOutlet weak var workColorImageView: UIImageView!
    
    @IBOutlet weak var socialLifeDesaturateImageView: UIImageView!
    @IBOutlet weak var workDesaturateImageView: UIImageView!
    @IBOutlet weak var sleepDesaturateImageView: UIImageView!
    
    @IBOutlet weak var socialLifeSwitch: UISwitch!
    @IBOutlet weak var workSwitch: UISwitch!
    @IBOutlet weak var sleepSwitch: UISwitch!
    
    @IBOutlet weak var socialLifeTextForSwitchLabel: UILabel!
    @IBOutlet weak var workTextForSwitchLabel: UILabel!
    @IBOutlet weak var sleepTextForSwitchLabel: UILabel!
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var zzzImageView: UIImageView!
    @IBOutlet weak var cloudImageView: UIImageView!
    
    @IBOutlet weak var trainImageView: UIImageView!
    @IBOutlet weak var trainHorizontalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var trafaretView: UIImageView!
    
    // Introduction
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    enum Choice {
        case work
        case socialLife
        case sleep
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColorImageView.alpha = 0
        
        socialLifeColorImageView.alpha = 0
        sleepColorImageView.alpha = 0
        workColorImageView.alpha = 0
        
        socialLifeDesaturateImageView.alpha = 0
        workDesaturateImageView.alpha = 0
        sleepDesaturateImageView.alpha = 0
        
        socialLifeSwitch.alpha = 0
        workSwitch.alpha = 0
        sleepSwitch.alpha = 0
        
        label1.alpha = 0
        label2.alpha = 0
        label3.alpha = 0
        label4.alpha = 0
        label5.alpha = 0
        
        socialLifeTextForSwitchLabel.alpha = 0
        workTextForSwitchLabel.alpha = 0
        sleepTextForSwitchLabel.alpha = 0

        catImageView.alpha = 0
        zzzImageView.alpha = 0
        
        motionEffect.applyMotionEffect(toView: backgroundColorImageView, magnitude: 60)
        
        trainHorizontalConstraint.constant = -170
        
        zzzImageView.alpha = 0
        catImageView.alpha = 0
        cloudImageView.alpha = 0
        trafaretView.alpha = 0
        
        animateGradient(toView: gradientView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation.showImageViewWithDelay(toView: backgroundColorImageView, delay: 17, alpha: 1)
        
        animation.showImageViewWithDelay(toView: socialLifeColorImageView, delay: 19, alpha: 0)
        animation.showImageViewWithDelay(toView: socialLifeDesaturateImageView, delay: 19, alpha: 1)
        animation.showImageViewWithDelay(toView: sleepColorImageView, delay: 23, alpha: 0)
        animation.showImageViewWithDelay(toView: sleepDesaturateImageView, delay: 23, alpha: 1)
        animation.showImageViewWithDelay(toView: workColorImageView, delay: 21, alpha: 0)
        animation.showImageViewWithDelay(toView: workDesaturateImageView, delay: 21, alpha: 1)
        
        animation.showImageViewWithDelay(toView: trafaretView, delay: 9, alpha: 1)
        animation.showImageViewWithDelay(toView: trafaretView, delay: 16, alpha: 0)
        
        animation.showSwitchWithDelay(toView: socialLifeSwitch, delay: 24, alpha: 1)
        animation.showSwitchWithDelay(toView: workSwitch, delay: 24, alpha: 1)
        animation.showSwitchWithDelay(toView: sleepSwitch, delay: 24, alpha: 1)
        
        animation.showLabelWithDelay(toView: label1, delay: 1, timeIntervale: 7, timerToDisable: true, text: "created by yauheni prakapenka")
        animation.showLabelWithDelay(toView: label4, delay: 3, timeIntervale: 7, timerToDisable: true, text: "linkedin.com/in/yauheniprakapenka")
        animation.showLabelWithDelay(toView: label5, delay: 3, timeIntervale: 7, timerToDisable: true, text: "Gomel, 2019")
        animation.showLabelWithDelay(toView: label2, delay: 7, timeIntervale: 11, timerToDisable: true, text: "Все успеть невозможно")
        animation.showLabelWithDelay(toView: label3, delay: 11, timeIntervale: 16.7, timerToDisable: true, text: "Сосредоточься только на том, что тебе действительно важно")
        
        animation.showLabelWithDelay(toView: socialLifeTextForSwitchLabel, delay: 24, timeIntervale: nil, timerToDisable: false, text: "Личная жизнь")
        animation.showLabelWithDelay(toView: workTextForSwitchLabel, delay: 24, timeIntervale: nil, timerToDisable: false, text: "Работа")
        animation.showLabelWithDelay(toView: sleepTextForSwitchLabel, delay: 24, timeIntervale: nil, timerToDisable: false, text: "Сон")
        animation.showLabelWithDelay(toView: resultLabel, delay: 26, timeIntervale: nil, timerToDisable: false, text: "Это большое счастье находить время\nна личную жизнь, работу и сон")

        catSprites = animation.createImageArray(total: 5, imagePrefix: "Cat")
        zzzSprites = animation.createImageArray(total: 2, imagePrefix: "z-z-z")
        cloudSprites = animation.createImageArray(total: 7, imagePrefix: "cloud")
        
        animation.animateArray(imageView: zzzImageView, images: zzzSprites, duration: 1.8)
        animation.animateArray(imageView: catImageView, images: catSprites, duration: 8)
        animation.animateArray(imageView: cloudImageView, images: cloudSprites, duration: 1.7)
    }
    
    @IBAction func toggleWorkSwitch(_ sender: UISwitch) {
        if !workSwitch.isOn {
            workColorImageView.alpha = 0
        }
        
        currentChoice = .work
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            socialLifeSwitch.isOn = false
            socialLifeColorImageView.alpha = 0
            cloudImageView.alpha = 0
            trainImageView.alpha = 0
            trainHorizontalConstraint.constant = -170
            resultLabel.text = "Но выбирая работу и сон\nне остается времени на личную жизнь"
        }
        workColorImageView.alpha = 1
        previousChoice = currentChoice
        
        if workSwitch.isOn {
            workColorImageView.alpha = 1
            catImageView.alpha = 1
        } else {
            workColorImageView.alpha = 0
            catImageView.alpha = 0
        }
    }
    
    @IBAction func toggleSocialLifeSwitch(_ sender: UISwitch) {
        currentChoice = .socialLife
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            if previousChoice == .work {
                sleepSwitch.isOn = false
                sleepColorImageView.alpha = 0
                zzzImageView.alpha = 0
                resultLabel.text = "Но выбирая личную жизнь и работу\nне остается времени на сон"
            } else {
                workSwitch.isOn = false
                workColorImageView.alpha = 0
                catImageView.alpha = 0
                resultLabel.text = "Но выбирая личную жизнь и сон\nне остается времени на работу"
            }
            socialLifeColorImageView.alpha = 1
        }
        previousChoice = currentChoice
        
        if socialLifeSwitch.isOn {
            socialLifeColorImageView.alpha = 1
            animateTrainOn()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                self.cloudImageView.alpha = 1
            }
        } else {
            socialLifeColorImageView.alpha = 0
            animateTrainOff()
            cloudImageView.alpha = 0
        }
    }
    
    @IBAction func toggleSleepSwitch(_ sender: UISwitch) {
        currentChoice = .sleep
        
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            if previousChoice == .socialLife {
                workSwitch.isOn = false
                socialLifeColorImageView.alpha = 1
                workColorImageView.alpha = 0
                catImageView.alpha = 0
                resultLabel.text = "Но выбирая личную жизнь и сон\nне остается времени на работу"
            } else {
                socialLifeSwitch.isOn = false
                socialLifeColorImageView.alpha = 0
                animateTrainOff()
                cloudImageView.alpha = 0
                resultLabel.text = "Но выбирая работу и сон\nне остается времени на личную жизнь"
            }
        }
        
        if sleepSwitch.isOn {
            sleepColorImageView.alpha = 1
            zzzImageView.alpha = 1
        } else {
            sleepColorImageView.alpha = 0
            zzzImageView.alpha = 0
        }
        previousChoice = currentChoice
    }
    
    func animateTrainOn() {
        trainImageView.alpha = 1
        UIView.animate(withDuration: 20, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.trainHorizontalConstraint.constant = 100
            self.view.layoutIfNeeded()
        })
    }
    
    func animateTrainOff() {
        trainImageView.alpha = 0
        trainHorizontalConstraint.constant = -170
        cloudImageView.alpha = 0
    }
    
    func animateGradient(toView: UIView) {
        let viewObject = toView
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 12.9) {
            viewObject.alpha = 1
            let gradient = CAGradientLayer(layer: viewObject.layer)
            gradient.colors = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
            gradient.locations = [0, 1]
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.frame = viewObject.bounds
            
            viewObject.layer.insertSublayer(gradient, at: 0)
            self.view.addSubview(viewObject)
            
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [0, 0.0]
            animation.toValue = [0, 1.0]
            animation.autoreverses = false
            animation.repeatCount = 1
            animation.duration = 1.3
            gradient.add(animation, forKey: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 14.7) {
            UIView.animate(withDuration: 2, animations: {
                self.gradientView.alpha = 0
            }, completion: nil)
        }
    }
    
}

