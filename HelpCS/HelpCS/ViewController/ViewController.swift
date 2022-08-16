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
    
    var loginInfo = LoginInfo() // 인스턴스 생성
        
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
       
        
    // 로그인 method
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in loginInfo.users {
            if user.id == id && user.pwd == pwd {
                return true // 로그인 성공
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightYellow
        print("도와줘 개발!")
        self.navigationController!.isNavigationBarHidden = true
        self.view?.safeAreaLayoutGuide.owningView?.backgroundColor = .lightYellow
        loginView.loginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        loginView.signUpBtn.addTarget(self, action: #selector(signUpBtnPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
        print(self.view.safeAreaInsets)
    }
}
