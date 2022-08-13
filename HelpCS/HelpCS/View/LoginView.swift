//
//  LoginView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        backgroundColor = .lightYellow
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 아이디 입력창 -> 위치 변경 필요
    lazy var mainIdTextField: UITextField = {
        let mainidText = UITextField()
        mainidText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        mainidText.textColor = .lightGreen
        mainidText.backgroundColor = .white
        mainidText.placeholder = "아이디"
        mainidText.borderStyle = .roundedRect
        mainidText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainidText
    }()
    
    // 비밀번호 입력창 -> 위치 변경 필요
    lazy var mainPwTextField: UITextField = {
        let mainpwText = UITextField()
        mainpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        mainpwText.textColor = .lightGreen
        mainpwText.backgroundColor = .white
        mainpwText.placeholder = "비밀번호"
        mainpwText.borderStyle = .roundedRect
        mainpwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainpwText
    }()
    
    // 회원가입 버튼 -> UIImage 변경 필요
    lazy var signUpBtn: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("회원가입", for: .normal)     // 버튼에 들어갈 글씨
        signUpButton.backgroundColor = .white       // 버튼 색상
        signUpButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
    }()
    
    // 로그인 버튼 -> UIImage 변경 필요
    lazy var loginBtn: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인", for: .normal)     // 버튼에 들어갈 글씨
        loginButton.backgroundColor = .white       // 버튼 색상
        loginButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()

    func makeSubView() {
        addSubview(mainIdTextField)
        addSubview(mainPwTextField)
        addSubview(signUpBtn)
        addSubview(loginBtn)
    }
    
    func makeConstraint() {
        mainIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainIdTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            mainIdTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            mainIdTextField.widthAnchor.constraint(equalToConstant: 350),
            mainIdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        mainPwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainPwTextField.topAnchor.constraint(equalTo: mainIdTextField.topAnchor, constant: 80),
            mainPwTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            mainPwTextField.widthAnchor.constraint(equalToConstant: 350),
            mainPwTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: mainPwTextField.topAnchor, constant: 100),
            signUpBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            signUpBtn.widthAnchor.constraint(equalToConstant: 100),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: mainPwTextField.topAnchor, constant: 100),
            loginBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
            loginBtn.widthAnchor.constraint(equalToConstant: 100),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
