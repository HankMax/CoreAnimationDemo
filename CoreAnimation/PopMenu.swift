//
//  PopMenu.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/29.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class PopMenu: UIButton {
    
    var isFold:Bool = true
    
    private var bottomView:UIView?
    
    private weak var orginView:UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(#imageLiteral(resourceName: "chooser-button-input"), for: .normal)
        self.setImage(#imageLiteral(resourceName: "chooser-button-input-highlighted"), for: .highlighted)
        self.addTarget(self, action: #selector(PopMenu.clickButton), for: .touchUpInside)
    }
    
    func rotation(tolayer:CALayer,index:CGFloat){
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.duration = 0.3
        if isFold {
            rotation.byValue = 2 * CGFloat.pi + CGFloat.pi/180 * -30 * index
        }else{
            rotation.byValue = -2 * CGFloat.pi + CGFloat.pi/180 * -30 * index
        }
        rotation.isRemovedOnCompletion = false
        rotation.fillMode = kCAFillModeForwards
        tolayer.add(rotation, forKey: "rotation")
    }
    
    func move(toLayer:UIView,index:CGFloat){
        
        let move = CABasicAnimation(keyPath: "position")
        move.duration = 0.3
        if isFold {
            move.fromValue = toLayer.center
            move.toValue = CGPoint(x:toLayer.center.x - 100 * sin(CGFloat.pi / 180 * index * 30), y:toLayer.center.y - 100 * cos(CGFloat.pi / 180 * index * 30))
            toLayer.center = CGPoint(x:toLayer.center.x - 100 * sin(CGFloat.pi / 180 * index * 30), y: toLayer.center.y - 100 * cos(CGFloat.pi / 180 * index * 30))
        }else{
            move.fromValue = toLayer.center
            move.toValue = bottomView?.center
            toLayer.center = (bottomView?.center)!
        }
       
        toLayer.layer.add(move, forKey: "move")
      
    }
    @objc
    private func clickButton() {
        if isFold {
            pop()
        }else{
            hide()
        }
    }
    
    func pop(){
        if let window = UIApplication.shared.keyWindow {
            bottomView = UIView()
            bottomView?.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.5)
            bottomView?.frame = window.bounds
            window.addSubview(bottomView!)
            self.orginView = self.superview
            let new = bottomView?.convert(self.frame.origin, from: self.superview!)
         
            for i in [-2,-1,0,1,2] {
                let index = i + 2
                let button = UIButton()
                button.frame = CGRect(origin: new!, size: self.bounds.size)
                button.tag = 100 + index
                button.backgroundColor = .white
                button.layer.cornerRadius = 18;
                button.setImage(UIImage(named: "\(5-index)"), for: .normal)
                button.setImage(UIImage(named: "\(5-index)highlighted"), for: .highlighted)
                button.addTarget(self, action: #selector(PopMenu.hide), for: .touchUpInside)
                bottomView?.addSubview(button)
                self.move(toLayer: button, index: CGFloat(i))
                self.rotation(tolayer: button.layer, index:CGFloat(i))
                
            }
            self.frame = CGRect(origin: new!, size: self.bounds.size)
            bottomView?.addSubview(self)
           isFold = false
        }
    }
    
    
    @objc func hide(){
  
        for i in [-2,-1,0,1,2] {
            let index = i + 2
            let tag = 100 + index
            let view = bottomView!.viewWithTag(tag)
            self.move(toLayer: view!, index: CGFloat(i))
            self.rotation(tolayer: (view?.layer)!, index:CGFloat(i))
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
            let new = self.orginView!.convert(self.frame.origin, from: self.bottomView!)
            self.frame = CGRect(origin: new, size: self.bounds.size)
            self.orginView?.addSubview(self)
            self.bottomView?.removeFromSuperview();
        })
        isFold = true
    }
    deinit {
        print("deinit")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

