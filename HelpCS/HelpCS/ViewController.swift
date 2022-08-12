//
//  ViewController.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    // 이름 입력창 -> 위치 변경 필요
    lazy var nameTextField: UITextField = {
        let nameText = UITextField()
        //        nameText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        nameText.placeholder = "이름"
        nameText.borderStyle = .roundedRect
        nameText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return nameText
    }()
    
    // 아이디 입력창 -> 위치 변경 필요
    lazy var idTextField: UITextField = {
        let idText = UITextField()
        //        idText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        idText.placeholder = "아이디"
        idText.borderStyle = .roundedRect
        idText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return idText
    }()
    
    // 비밀번호 입력창 -> 위치 변경 필요
    lazy var pwTextField: UITextField = {
        let pwText = UITextField()
        //        pwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        pwText.placeholder = "비밀번호"
        pwText.borderStyle = .roundedRect
        pwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return pwText
    }()
    
    // 회원가입 버튼 -> UIImage 변경 필요
    lazy var signUpBtn: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
    }()
    
    // 로그인 버튼 -> UIImage 변경 필요
    lazy var loginBtn: UIButton = {
        let loginButton = UIButton()
        loginButton.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()
    
    // 기능추가 필요
    lazy var questionText: UIScrollView = {
        let questionText = UITextView()
        questionText.translatesAutoresizingMaskIntoConstraints = false
        questionText.text = "..질문.."
        questionText.isScrollEnabled = false
        questionText.isSelectable = false
        questionText.isEditable = false
        return questionText
    }()
    
    // O 버튼 -> UIImage 변경 필요
    lazy var oBtn: UIButton = {
        let oBtn = UIButton()
        oBtn.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        oBtn.addTarget(self, action: #selector(oAction), for: .touchUpInside)
        return oBtn
    }()
    
    // X 버튼 -> UIImage 변경 필요
    lazy var xBtn: UIButton = {
        let xBtn = UIButton()
        xBtn.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        xBtn.addTarget(self, action: #selector(xAction), for: .touchUpInside)
        return xBtn
    }()
    
    // 더 알아보기 버튼 -> UIImage 변경 필요
    lazy var linkConnectionBtn: UIButton = {
        let connectionBtn = UIButton()
        connectionBtn.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        connectionBtn.translatesAutoresizingMaskIntoConstraints = false
        connectionBtn.addTarget(self, action: #selector(connectionAction), for: .touchUpInside)
        return connectionBtn
    }()
    
    // UIImage 보이기
    lazy var myImage: UIImage = {
        let myImage = UIImage()
        
        return myImage
    }()
    
    // MyPageView에 있는 List
    lazy var listView : UITextView = {
        let listView = UITextView()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // subView에 넣어줌.
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(loginBtn)
        self.view.addSubview(oBtn)
        self.view.addSubview(xBtn)
        self.view.addSubview(linkConnectionBtn)
//        self.view.addSubview(myImage)
        self.view.addSubview(listView)
        
        // 위치 제약조건 설정 필요 ..
        // signUpBtn 위치 설정(제약 조건)
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        signUpBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        signUpBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        // loginBtn 위치 설정(제약 조건)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        loginBtn.topAnchor.constraint(equalTo: signUpBtn.topAnchor, constant: 50).isActive = true
    }
}

extension ViewController {
    @objc func signUpAction() {
        // 회원가입 action
    }
    
    @objc func loginAction() {
        // 로그인 action
    }
    
    @objc func oAction() {
        
    }
    
    @objc func xAction() {
        
    }
    
    @objc func connectionAction() {
        
    }
}
