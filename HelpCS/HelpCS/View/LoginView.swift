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
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    lazy var mainPwTextField: UITextField = {
        let mainpwText = UITextField()
        mainpwText.textColor = .lightGreen
        mainpwText.backgroundColor = .white
        mainpwText.placeholder = "비밀번호"
        mainpwText.layer.cornerRadius = 5
        mainpwText.layer.borderWidth = 1
        mainpwText.layer.borderColor = UIColor.darkGreen?.cgColor
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
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.darkGreen?.cgColor
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
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGreen?.cgColor
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()
    
    func makeSubView() {
        addSubview(logoImage)
        addSubview(self.mainText)
        addSubview(mainIdTextField)
        addSubview(mainPwTextField)
        addSubview(signUpBtn)
        addSubview(loginBtn)
    }
    
    func makeConstraint() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 200),
        ])
        mainText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            mainText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
        mainIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainIdTextField.topAnchor.constraint(equalTo: mainText.topAnchor, constant: 100),
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
