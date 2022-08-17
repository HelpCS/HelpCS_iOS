//
//  ViewController.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    let loginView: UIView = {
        let loginView = UIView()
        return loginView
    }()
    
    var loginInfo = LoginInfo() // 인스턴스 생성
        
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
       
    // Logo Image
    lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.backgroundColor = .white
        logoImage.image = UIImage(named: "helpCSLogo")
        logoImage.layer.cornerRadius = 5
        logoImage.layer.borderWidth = 1
        logoImage.layer.borderColor = UIColor.darkGreen?.cgColor
        logoImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        logoImage.layer.shadowOpacity = 0.3
        logoImage.layer.shadowRadius = 5
        logoImage.layer.shadowColor = UIColor.darkGreen?.cgColor
        logoImage.contentMode = .scaleAspectFill
        return logoImage
    }()
    
    // HelpCS
    lazy var mainText: UILabel = {
        let mainText = UILabel()
        mainText.textColor = .darkGreen
        mainText.backgroundColor = .lightYellow
        mainText.font = UIFont.systemFont(ofSize: 30)
        mainText.text = "도와줘 개발!"
        mainText.sizeToFit()
        return mainText
    }()
    
    // 아이디 입력창 -> 위치 변경 필요
    lazy var mainIdTextField: UITextField = {
        let mainidText = UITextField()
        mainidText.textColor = .lightGreen
        mainidText.backgroundColor = .white
        mainidText.placeholder = "아이디"
        mainidText.layer.cornerRadius = 5
        mainidText.layer.borderWidth = 1
        mainidText.layer.borderColor = UIColor.darkGreen?.cgColor
        mainidText.borderStyle = .roundedRect
        mainidText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainidText
    }()
    
    // 비밀번호 입력창 -> 위치 변경 필요
    lazy var mainPwdTextField: UITextField = {
        let mainpwdText = UITextField()
        mainpwdText.textColor = .lightGreen
        mainpwdText.backgroundColor = .white
        mainpwdText.placeholder = "비밀번호"
        mainpwdText.layer.cornerRadius = 5
        mainpwdText.layer.borderWidth = 1
        mainpwdText.layer.borderColor = UIColor.darkGreen?.cgColor
        mainpwdText.borderStyle = .roundedRect
        mainpwdText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainpwdText
    }()
    
    // 회원가입 버튼 -> UIImage 변경 필요
    lazy var signUpBtn: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("회원가입", for: .normal)     // 버튼에 들어갈 글씨
        signUpButton.backgroundColor = .newYellow       // 버튼 색상
        signUpButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.darkGreen?.cgColor
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        return signUpButton
    }()
    
    // 로그인 버튼 -> UIImage 변경 필요
    lazy var loginBtn: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인", for: .normal)     // 버튼에 들어갈 글씨
        loginButton.backgroundColor = .newYellow       // 버튼 색상
        loginButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGreen?.cgColor
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()
    
    // 로그인 확인하기
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in loginInfo.users {
            if user.id == id && user.pwd == pwd {
                return true // 로그인 성공
            }
        }
        return false
    }
    
    // TextField 흔들기 애니메이션
    func shakeTextField(textField: UITextField) -> Void{
        UIView.animate(withDuration: 0.2, animations: {
            textField.frame.origin.x -= 10
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x += 20
             }, completion: { _ in
                 UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x -= 10
                })
            })
        })
    }
        
        
    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        if mainIdTextField.isFirstResponder {
            mainPwdTextField.becomeFirstResponder()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
        
        self.view.addSubview(logoImage)
        self.view.addSubview(self.mainText)
        self.view.addSubview(mainIdTextField)
        self.view.addSubview(mainPwdTextField)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(loginBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightYellow
        print("도와줘 개발!")
        
        self.navigationController!.isNavigationBarHidden = true
        self.view?.safeAreaLayoutGuide.owningView?.backgroundColor = .lightYellow
        

        // 키보드 내리기
        mainIdTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        mainPwdTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        loginBtn.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        signUpBtn.addTarget(self, action: #selector(signUpBtnPressed), for: .touchUpInside)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 200),
        ])
        mainText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            mainText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        ])
        mainIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainIdTextField.topAnchor.constraint(equalTo: mainText.topAnchor, constant: 100),
            mainIdTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            mainIdTextField.widthAnchor.constraint(equalToConstant: 350),
            mainIdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        mainPwdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainPwdTextField.topAnchor.constraint(equalTo: mainIdTextField.topAnchor, constant: 80),
            mainPwdTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            mainPwdTextField.widthAnchor.constraint(equalToConstant: 350),
            mainPwdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: mainPwdTextField.topAnchor, constant: 100),
            signUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -80),
            signUpBtn.widthAnchor.constraint(equalToConstant: 100),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: mainPwdTextField.topAnchor, constant: 100),
            loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 80),
            loginBtn.widthAnchor.constraint(equalToConstant: 100),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
