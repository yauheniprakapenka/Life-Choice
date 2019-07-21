//
//  Animation.swift
//  LifeChoice
//
//  Created by yauheni prakapenka on 20/07/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation
import UIKit

class Animation {
    func showImageViewWithDelay(toView: UIImageView, delay: Double, alpha: CGFloat) {
        let imageView = toView
        UIView.animate(withDuration: 1, delay: delay, options: [], animations: {
            imageView.alpha = alpha
        }, completion: nil)
    }
    
    func showSwitchWithDelay(toView: UISwitch, delay: Double, alpha: CGFloat) {
        let uiSwitch = toView
        UIView.animate(withDuration: 1, delay: delay, options: [], animations: {
            uiSwitch.alpha = alpha
        }, completion: nil)
    }
    
    func showLabelWithDelay(toView: UILabel, delay: Double, timeIntervale: Double, alpha: CGFloat, text: String) {
        let uiLabel = toView
        uiLabel.text = text
        
        UIView.animate(withDuration: 1, delay: delay, options: [], animations: {
            uiLabel.alpha = alpha
        }, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: timeIntervale, repeats: false, block: { timer in
            UIImageView.animate(withDuration: 1) { [weak self] in
            toView.alpha = 0
            }
        })
    }
}
