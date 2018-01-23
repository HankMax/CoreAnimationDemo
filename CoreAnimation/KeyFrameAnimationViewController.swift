//
//  PropertyAnimationViewController.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/26.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class KeyFrameAnimationViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func property(_ sender: UIButton) {
        let key = CAKeyframeAnimation(keyPath: "position")
        key.duration = 2.0
        key.values = [CGPoint(x: 100, y: 150),
                      CGPoint(x: 250, y: 250),
                      CGPoint(x: 250, y: 300),
                      CGPoint(x: 350, y: 300)]
        myView.layer.add(key, forKey: "keyAnimation")
    }
    
    @IBAction func path(_ sender: UIButton) {
        let pathAnima = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 150),
                                radius: 100,
                                startAngle: 0,
                                endAngle: 2*(.pi),
                                clockwise: true)
        pathAnima.path = path.cgPath
        pathAnima.duration = 2
        myView.layer.add(pathAnima, forKey: "pathAnimation")
    }
    
    @IBAction func shake(_ sender: UIButton) {
        
        let shake = CAKeyframeAnimation(keyPath: "transform")
        shake.duration = 0.25
        shake.repeatCount = 100
        shake.values = [CATransform3DMakeRotation(0, 0, 0, 1),
                        CATransform3DMakeRotation(.pi/32, 0, 0, 1),
                        CATransform3DMakeRotation(.pi/32, 0, 0, -1),
                        CATransform3DMakeRotation(0, 0, 0, 1)]
        myView.layer.add(shake, forKey: "shakeAnimation")
    }
}
