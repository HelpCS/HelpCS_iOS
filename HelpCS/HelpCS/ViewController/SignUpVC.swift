//
//  SignUpVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class SignUpVC: UIViewController {
    let signUpView: SignUpView = {
        let signUpView = SignUpView()
        return signUpView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LoginView"
        signUpView.signloginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = signUpView
    }
}
