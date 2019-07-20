//
//  ViewController.swift
//  LifeChoice
//
//  Created by yauheni prakapenka on 20/07/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Choice {
        case work
        case socialLife
        case sleep
    }
    
    var previousChoice = Choice.sleep
    var currentChoice = Choice.sleep
    
    let motionEffect = MotionEffect()
    
    @IBOutlet weak var socialLifeImageView: UIImageView!
    @IBOutlet weak var sleepImageView: UIImageView!
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var workSwitch: UISwitch!
    @IBOutlet weak var socialLifeSwitch: UISwitch!
    @IBOutlet weak var sleepSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workImageView.alpha = 1
        socialLifeImageView.alpha = 0
        sleepImageView.alpha = 0
        
        motionEffect.applyMotionEffect(toView: backgroundImageView, magnitude: 40)
    }
    
    @IBAction func toggleWorkSwitch(_ sender: UISwitch) {
        if !workSwitch.isOn {
            workImageView.alpha = 0
        }
        
        currentChoice = .work
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            socialLifeSwitch.isOn = false
            socialLifeImageView.alpha = 0
        }
        workImageView.alpha = 1
        previousChoice = currentChoice
        if workSwitch.isOn {
            workImageView.alpha = 1
        } else {
            workImageView.alpha = 0
        }
    }
    
    @IBAction func toggleSocialLifeSwitch(_ sender: UISwitch) {
        currentChoice = .socialLife
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            if previousChoice == .work {
                sleepSwitch.isOn = false
                sleepImageView.alpha = 0
            } else {
                workSwitch.isOn = false
                workImageView.alpha = 0
            }
            socialLifeImageView.alpha = 1
        }
        previousChoice = currentChoice
        if socialLifeSwitch.isOn {
            socialLifeImageView.alpha = 1
        } else {
            socialLifeImageView.alpha = 0
        }
    }
    
    @IBAction func toggleSleepSwitch(_ sender: UISwitch) {
        currentChoice = .sleep
        if workSwitch.isOn && socialLifeSwitch.isOn && sleepSwitch.isOn {
            if previousChoice == .socialLife {
                workSwitch.isOn = false
                socialLifeImageView.alpha = 1
                workImageView.alpha = 0
            } else {
                socialLifeSwitch.isOn = false
                socialLifeImageView.alpha = 0
            }
        }
        if sleepSwitch.isOn {
            sleepImageView.alpha = 1
        } else {
            sleepImageView.alpha = 0
        }
        previousChoice = currentChoice
    }
    
}

