//
//  DemoViewController.swift
//  CoreAnimation
//
//  Created by 张豪 on 2017/12/28.
//  Copyright © 2017年 HankMax. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let loadingView = LoadingView(frame:CGRect(x: 100, y: 100, width: 100, height: 100))
        loadingView.startLoding()
        view.addSubview(loadingView)
        
        let pop = PopMenu(frame: CGRect(x: 100, y: 100, width: 38, height: 38))
        pop.center = view.center
        self.view.addSubview(pop)

    }

}
