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
    
    // Introduction
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
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
        
        socialLifeTextForSwitchLabel.alpha = 0
        workTextForSwitchLabel.alpha = 0
        sleepTextForSwitchLabel.alpha = 0

        catImageView.alpha = 0
        zzzImageView.alpha = 0
        
        motionEffect.applyMotionEffect(toView: backgroundColorImageView, magnitude: 50)
        
        trainHorizontalConstraint.constant = -170
        
        zzzImageView.alpha = 0
        catImageView.alpha = 0
        cloudImageView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation.showImageViewWithDelay(toView: backgroundColorImageView, delay: 15, alpha: 1)
        
        animation.showImageViewWithDelay(toView: socialLifeColorImageView, delay: 17, alpha: 0)
        animation.showImageViewWithDelay(toView: socialLifeDesaturateImageView, delay: 17, alpha: 1)
        animation.showImageViewWithDelay(toView: sleepColorImageView, delay: 21, alpha: 0)
        animation.showImageViewWithDelay(toView: sleepDesaturateImageView, delay: 21, alpha: 1)
        animation.showImageViewWithDelay(toView: workColorImageView, delay: 19, alpha: 0)
        animation.showImageViewWithDelay(toView: workDesaturateImageView, delay: 19, alpha: 1)
        
        animation.showSwitchWithDelay(toView: socialLifeSwitch, delay: 22, alpha: 1)
        animation.showSwitchWithDelay(toView: workSwitch, delay: 22, alpha: 1)
        animation.showSwitchWithDelay(toView: sleepSwitch, delay: 22, alpha: 1)
        
        animation.showLabelWithDelay(toView: label1, delay: 2, timeIntervale: 5, timerToDisable: true, text: "created by yauheni prakapenka")
        animation.showLabelWithDelay(toView: label2, delay: 6, timeIntervale: 9, timerToDisable: true, text: "Все успеть невозможно")
        animation.showLabelWithDelay(toView: label3, delay: 10, timeIntervale: 14, timerToDisable: true, text: "Сосредоточься только на том, что тебе действительно важно")
        
        animation.showLabelWithDelay(toView: socialLifeTextForSwitchLabel, delay: 22, timeIntervale: nil, timerToDisable: false, text: "Личная жизнь")
        animation.showLabelWithDelay(toView: workTextForSwitchLabel, delay: 22, timeIntervale: nil, timerToDisable: false, text: "Работа")
        animation.showLabelWithDelay(toView: sleepTextForSwitchLabel, delay: 22, timeIntervale: nil, timerToDisable: false, text: "Сон")

        catSprites = animation.createImageArray(total: 5, imagePrefix: "Cat")
        zzzSprites = animation.createImageArray(total: 2, imagePrefix: "z-z-z")
        cloudSprites = animation.createImageArray(total: 7, imagePrefix: "cloud")
        animation.animateArray(imageView: zzzImageView, images: zzzSprites, duration: 1.8)
        animation.animateArray(imageView: catImageView, images: catSprites, duration: 8)
        animation.animateArray(imageView: cloudImageView, images: cloudSprites, duration: 1.3)
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
            } else {
                workSwitch.isOn = false
                workColorImageView.alpha = 0
                catImageView.alpha = 0
            }
            socialLifeColorImageView.alpha = 1
        }
        previousChoice = currentChoice
        
        if socialLifeSwitch.isOn {
            socialLifeColorImageView.alpha = 1
            animateTrainOn()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
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
            } else {
                socialLifeSwitch.isOn = false
                socialLifeColorImageView.alpha = 0
                animateTrainOff()
                cloudImageView.alpha = 0
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
        UIView.animate(withDuration: 10, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.trainHorizontalConstraint.constant = 100
            self.view.layoutIfNeeded()
        })
    }
    
    func animateTrainOff() {
        trainImageView.alpha = 0
        trainHorizontalConstraint.constant = -170
        cloudImageView.alpha = 0
    }
    
}

