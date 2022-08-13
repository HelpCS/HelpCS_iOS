//
//  ViewController.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    let loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LoginView"
        loginView.loginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        loginView.signUpBtn.addTarget(self, action: #selector(signUpBtnPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
}
