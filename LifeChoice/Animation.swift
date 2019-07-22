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
        UIView.animate(withDuration: 2, delay: delay, options: [], animations: {
            imageView.alpha = alpha
        }, completion: nil)
    }
    
    func showSwitchWithDelay(toView: UISwitch, delay: Double, alpha: CGFloat) {
        let uiSwitch = toView
        UIView.animate(withDuration: 2, delay: delay, options: [], animations: {
            uiSwitch.alpha = alpha
        }, completion: nil)
    }
    
    func showLabelWithDelay(toView: UILabel, delay: Double, timeIntervale: Double? = nil, timerToDisable: Bool, text: String) {
        let uiLabel = toView
        uiLabel.text = text
        
        UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: {
            uiLabel.alpha = 1
        }, completion: nil)
        
        if timerToDisable {
            Timer.scheduledTimer(withTimeInterval: timeIntervale ?? 0, repeats: false, block: { timer in
                UIImageView.animate(withDuration: 1) { [weak self] in
                    toView.alpha = 0
                }
            })
        }
    }
    
    func animateArray(imageView: UIImageView, images: [UIImage], duration: Double) {
        imageView.animationImages = images
//        imageView.alpha = 1
        imageView.animationDuration = duration
        imageView.animationRepeatCount = 99999
        imageView.startAnimating()
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
}
