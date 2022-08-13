//
//  MainVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MainVC: UIViewController {
    let mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MainView"
        mainView.plusBtn.addTarget(self, action: #selector(plusBtnPressed), for: .touchUpInside)
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
}
