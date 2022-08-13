//
//  MyPageVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MyPageVC: UIViewController {
    let myPageView: MyPageView = {
        let myPageView = MyPageView()
        return myPageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MyPageView"
//        mainView.plusBtn.addTarget(self, action: #selector(plusBtnPressed), for: .touchUpInside)
    }
    override func loadView() {
        super.loadView()
        view = myPageView
    }
}

