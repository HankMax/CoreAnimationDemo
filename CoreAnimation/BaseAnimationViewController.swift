//
//  ViewController.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/19.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class BaseAnimationViewController: UIViewController {
    
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func move(_ sender: UIButton) {
        let move = CABasicAnimation(keyPath: "position.x")
        move.duration = 1
        move.byValue = 200
        /* 等价于
        move.fromValue = 187
        move.toValue = 387
        */
//        move.isRemovedOnCompletion = false
//        move.fillMode = kCAFillModeForwards
    /*
        isRemovedOnCompletion = false &&
        fillMode = kCAFillModeForwards时动画结束不会复原
    */
        myView.layer.add(move, forKey: "moveAnimation")
    }
    
    @IBAction func alpa(_ sender: UIButton) {
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.duration = 1
        opacity.toValue = 0
        myView.layer.add(opacity, forKey: "alphaAnimation")
    }
    @IBAction func rotation(_ sender: UIButton) {
        let move = CABasicAnimation(keyPath: "transform.rotation.z")
        move.duration = 1
        move.toValue = CGFloat.pi*2.0
        myView.layer.add(move, forKey: "alphaAnimation")
    }
    
    @IBAction func back(_ sender: UIButton) {

        let back = CABasicAnimation(keyPath: "backgroundColor")
        back.duration = 1
        back.toValue = UIColor.red.cgColor
        myView.layer.add(back, forKey: "backAnimation")
    }
}

