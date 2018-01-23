//
//  TransactionAnimationViewController.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/28.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class TransactionAnimationViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Fade(_ sender: UIButton) {
        changeView()
        let fade = CATransition()
        fade.duration = 1
        fade.type = kCATransitionFade
        fade.subtype = kCATransitionFromRight
//        fade.startProgress = 0.3
//        fade.endProgress = 0.8
        myView.layer.add(fade, forKey: "fadeAnimation")
    }
    
    @IBAction func MoveIn(_ sender: UIButton) {
        changeView()
        let moveIn = CATransition()
        moveIn.duration = 1
        moveIn.type = kCATransitionMoveIn
        moveIn.subtype = kCATransitionFromLeft
        myView.layer.add(moveIn, forKey: "moveInAnimation")
    }
    @IBAction func Push(_ sender: UIButton) {
        changeView()
        let push = CATransition()
        push.duration = 1
        push.type = kCATransitionPush
        push.subtype = kCATransitionFromTop
        myView.layer.add(push, forKey: "pushAnimation")
    }
    @IBAction func Reveal(_ sender: UIButton) {
        changeView()
        let reveal = CATransition()
        reveal.duration = 1
        reveal.type = kCATransitionReveal
        reveal.subtype = kCATransitionFromBottom
        myView.layer.add(reveal, forKey: "fadeAnimation")
    }
    
    func changeView(){
        if lable.text == "1"{
            lable.text = "2"
            myView.backgroundColor = UIColor.red
        }else{
            lable.text = "1"
            myView.backgroundColor = UIColor.orange
        }
    }
}
