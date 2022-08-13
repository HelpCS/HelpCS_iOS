//
//  ViewController.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    // 로그인 페이지
    let loginView: UIView = {
        let loginview = UIView()
        loginview.backgroundColor = .white
        loginview.layer.cornerRadius = 16
        loginview.isHidden = true
        loginview.translatesAutoresizingMaskIntoConstraints = false
        return loginview
    }()
    
    // 아이디 입력창 -> 위치 변경 필요
    lazy var mainIdTextField: UITextField = {
        let mainidText = UITextField()
        mainidText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        mainidText.placeholder = "아이디"
        mainidText.borderStyle = .roundedRect
        mainidText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainidText
    }()
    
    // 비밀번호 입력창 -> 위치 변경 필요
    lazy var mainPwTextField: UITextField = {
        let mainpwText = UITextField()
        mainpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        mainpwText.placeholder = "비밀번호"
        mainpwText.borderStyle = .roundedRect
        mainpwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return mainpwText
    }()
    
    // 회원가입 버튼 -> UIImage 변경 필요
    lazy var signUpBtn: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("회원가입", for: .normal)     // 버튼에 들어갈 글씨
        signUpButton.backgroundColor = .systemGray       // 버튼 색상
        signUpButton.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
    }()
    
    // 로그인 버튼 -> UIImage 변경 필요
    lazy var loginBtn: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인", for: .normal)     // 버튼에 들어갈 글씨
        loginButton.backgroundColor = .systemGray       // 버튼 색상
        loginButton.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()
    
    // 회원가입 페이지
    let signUpView: UIView = {
        let signUpview = UIView()
        signUpview.backgroundColor = .white
        signUpview.layer.cornerRadius = 16
        signUpview.isHidden = true
        signUpview.translatesAutoresizingMaskIntoConstraints = false
        return signUpview
    }()
    
    // 이름 입력창 -> 위치 변경 필요
    lazy var nameTextField: UITextField = {
        let nameText = UITextField()
        nameText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        nameText.placeholder = "이름"
        nameText.borderStyle = .roundedRect
        nameText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return nameText
    }()
    
    // 아이디 입력창 -> 위치 변경 필요
    lazy var idTextField: UITextField = {
        let idText = UITextField()
        idText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        idText.placeholder = "아이디"
        idText.borderStyle = .roundedRect
        idText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return idText
    }()
    
    // 비밀번호 입력창 -> 위치 변경 필요
    lazy var pwTextField: UITextField = {
        let pwText = UITextField()
        pwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        pwText.placeholder = "비밀번호"
        pwText.borderStyle = .roundedRect
        pwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return pwText
    }()
    
    // 비밀번호 확인 입력창 -> 위치 변경 필요
    lazy var checkPwTextField: UITextField = {
        let checkpwText = UITextField()
        checkpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        checkpwText.placeholder = "비밀번호"
        checkpwText.borderStyle = .roundedRect
        checkpwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return checkpwText
    }()
    
    // 로그인 버튼 -> UIImage 변경 필요
    lazy var signloginBtn: UIButton = {
        let signloginButton = UIButton()
        signloginButton.setTitle("로그인", for: .normal)     // 버튼에 들어갈 글씨
        signloginButton.backgroundColor = .systemGray       // 버튼 색상
        signloginButton.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        signloginButton.translatesAutoresizingMaskIntoConstraints = false
        signloginButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        return signloginButton
    }()

    
    // main 페이지
    let mainView: UIView = {
        let mainview = UIView()
        mainview.backgroundColor = .white
        mainview.layer.cornerRadius = 16
        mainview.isHidden = true
        mainview.translatesAutoresizingMaskIntoConstraints = false
        return mainview
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
        oBtn.setTitle("O", for: .normal)     // 버튼에 들어갈 글씨
        oBtn.backgroundColor = .systemGray       // 버튼 색상
        oBtn.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        oBtn.addTarget(self, action: #selector(oAction), for: .touchUpInside)
        return oBtn
    }()
    
    // X 버튼 -> UIImage 변경 필요
    lazy var xBtn: UIButton = {
        let xBtn = UIButton()
        xBtn.setTitle("X", for: .normal)     // 버튼에 들어갈 글씨
        xBtn.backgroundColor = .systemGray       // 버튼 색상
        xBtn.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        xBtn.addTarget(self, action: #selector(xAction), for: .touchUpInside)
        return xBtn
    }()
    
    // 더 알아보기 버튼 -> UIImage 변경 필요
    lazy var linkConnectionBtn: UIButton = {
        let connectionBtn = UIButton()
        connectionBtn.setTitle("더 알아보기", for: .normal)     // 버튼에 들어갈 글씨
        connectionBtn.backgroundColor = .systemGray       // 버튼 색상
        connectionBtn.setTitleColor(.white, for: .normal) // 버튼 글씨 색상
        connectionBtn.translatesAutoresizingMaskIntoConstraints = false
        connectionBtn.addTarget(self, action: #selector(connectionAction), for: .touchUpInside)
        return connectionBtn
    }()
    
    // MyPage 페이지
    let myPageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.view.addSubview(loginView)
        self.loginView.addSubview(mainIdTextField)
        self.loginView.addSubview(mainPwTextField)
        self.loginView.addSubview(signUpBtn)
        self.loginView.addSubview(loginBtn)
        self.view.addSubview(signUpView)
        self.signUpView.addSubview(nameTextField)
        self.signUpView.addSubview(idTextField)
        self.signUpView.addSubview(pwTextField)
        self.view.addSubview(mainView)
        self.mainView.addSubview(oBtn)
        self.mainView.addSubview(xBtn)
        self.mainView.addSubview(linkConnectionBtn)
        self.view.addSubview(myPageView)
//        self.myPageView.addSubview(myImage)
        self.myPageView.addSubview(listView)
        
        
        // View 위치 설정(제약조건)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
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
    @objc func signUpAction(sender: UITapGestureRecognizer) {
        // 회원가입 action -> View 이동
        createSignUp()
    }
    
    @objc func createSignUp() {
        print("회원가입 버튼 클릭")
        signUpView.isHidden.toggle()
    }
    // popUpView 닫기 (회원가입 창)
    @objc func confirmAction() {
        print("로그인 화면으로 돌아가기!")
        signUpView.isHidden = true
    }
    
    
    @objc func loginAction(sender: UITapGestureRecognizer) {
        // 로그인 action -> 로그인 후 View 이동
    }
    
    @objc func oAction(sender: UITapGestureRecognizer) {
        // 정답 확인하기
    }
    
    @objc func xAction(sender: UITapGestureRecognizer) {
        // 정답 확인하기
    }
    
    @objc func connectionAction(sender: UITapGestureRecognizer) {
        // 관련 링크로 연결
    }
}
