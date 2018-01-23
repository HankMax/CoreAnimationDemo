//
//  GroupAnimationViewController.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/27.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class GroupAnimationViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func synchrony(_ sender: UIButton) {
        let key = CAKeyframeAnimation(keyPath: "position")
        key.duration = 2.0
        key.values = [CGPoint(x: 100, y: 150),
                      CGPoint(x: 250, y: 250),
                      CGPoint(x: 250, y: 300),
                      CGPoint(x: 350, y: 300)]
        
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.duration = 1
        opacity.toValue = 0
        
        let move = CABasicAnimation(keyPath: "transform.rotation.z")
        move.duration = 1
        move.toValue = CGFloat.pi*2.0
        
        let group = CAAnimationGroup()
        group.duration = 3
        group.animations = [key,opacity,move]
        myView.layer.add(group, forKey: "groupAnimation")
     
        /*
         组动画等价于连续添加多个动画到此layer中
         myView.layer.add(key, forKey: "positionAnimation")
         myView.layer.add(opacity, forKey: "opacityAnimation")
         myView.layer.add(move, forKey: "rotationAnimation")
         */
        
    }
    
    @IBAction func serial(_ sender: UIButton) {
        let key = CAKeyframeAnimation(keyPath: "position")
        key.beginTime = 0 //beginTime动画开始的时间默认值0,添加就执行
        key.duration = 2.0
        key.fillMode = kCAFillModeForwards
        key.isRemovedOnCompletion = false
        key.values = [CGPoint(x: 100, y: 150),
                      CGPoint(x: 250, y: 250),
                      CGPoint(x: 250, y: 300),
                      CGPoint(x: 350, y: 300)]
        
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.duration = 1
        opacity.toValue = 0
        opacity.beginTime = key.beginTime + key.duration
        
        let move = CABasicAnimation(keyPath: "transform.rotation.z")
        move.duration = 1
        move.beginTime = opacity.beginTime + opacity.duration
        move.toValue = CGFloat.pi*2.0
        
        let shake = CAKeyframeAnimation(keyPath: "transform")
        shake.duration = 0.25
        shake.repeatCount = 100
        shake.beginTime = move.beginTime + move.duration
        shake.values = [CATransform3DMakeRotation(0, 0, 0, 1),
                        CATransform3DMakeRotation(.pi/32, 0, 0, 1),
                        CATransform3DMakeRotation(.pi/32, 0, 0, -1),
                        CATransform3DMakeRotation(0, 0, 0, 1)]
        let group = CAAnimationGroup()
        group.duration = 5
        group.animations = [key,opacity,move,shake]
        myView.layer.add(group, forKey: "groupAnimation")
    }
    
    
}
