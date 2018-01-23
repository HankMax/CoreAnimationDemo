//
//  LoadingView.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/28.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    let loadingLayer = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadingLayer.frame = self.bounds
        let path = UIBezierPath()
        let size = frame.size
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                    radius: size.width / 2,
                    startAngle: -(.pi / 2) ,
                    endAngle: .pi + .pi / 2,
                    clockwise: true)
        loadingLayer.fillColor = nil
        loadingLayer.strokeColor = UIColor.red.cgColor
        loadingLayer.lineWidth = 2
        loadingLayer.path = path.cgPath
        self.layer.addSublayer(loadingLayer)
    }
    
    func startLoding(){
        let beginTime: Double = 0.5
        let strokeStartDuration: Double = 1.2
        let strokeEndDuration: Double = 0.7
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.byValue = Float.pi * 2
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.duration = strokeEndDuration
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.duration = strokeStartDuration
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        strokeStartAnimation.beginTime = beginTime
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [rotationAnimation,strokeEndAnimation, strokeStartAnimation]
        groupAnimation.duration = strokeStartDuration + beginTime
        groupAnimation.repeatCount = .infinity
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        
        self.loadingLayer.add(groupAnimation, forKey: "loading")
    }
    
    func stopLoding(){
        self.loadingLayer.removeAnimation(forKey: "loading")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
