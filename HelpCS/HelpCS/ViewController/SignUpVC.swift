//
//  SignUpVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class SignUpVC: UIViewController {
    let signUpView: UIView = {
        let signUpView = UIView()
        signUpView.backgroundColor = .lightYellow
        return signUpView
    }()
    
    var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGreen
        return view
    }()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        label.text = "회원가입"
        backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        saveBtn.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        // 키보드 내리기
        nameTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        idTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        pwdTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        checkPwdTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        saveBtn.addTarget(self, action: #selector(didTapJoinButton), for: UIControl.Event.editingDidEndOnExit)
        
    }
    
    var userModel = SignUpInfo.init() // 인스턴스 생성
    
    // 회원 확인 method
    func isUser(id: String) -> Bool {
        for user in [userModel] {
            if user.id == id {
                return true // 이미 회원인 경우
            }
        }
        return false
    }
    
    
    @IBAction func didTapJoinButton(_ sender: Any) {
        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let id = idTextField.text, !id.isEmpty else { return }
        guard let pwd = pwdTextField.text, !pwd.isEmpty else { return }
        guard let checkPwd = checkPwdTextField.text, !checkPwd.isEmpty else { return }
        
//        if userModel(id: id){
//            if let removable = self.view.viewWithTag(100) {
//                removable.removeFromSuperview()
//            }
//        }
//        else {
//            shakeTextField(textField: nameTextField)
//            let emailLabel = UILabel(frame: CGRect(x: 68, y: 350, width: 279, height: 45))
//            emailLabel.text = "이름을 입력해주세요."
//            emailLabel.textColor = UIColor.red
//            emailLabel.tag = 100
//
//            self.view.addSubview(emailLabel)
//        }
//
//        if userModel(pwd: pwd){
//            if let removable = self.view.viewWithTag(101) {
//                removable.removeFromSuperview()
//            }
//        }
//        else{
//            shakeTextField(textField: pwdTextField)
//            let passwordLabel = UILabel(frame: CGRect(x: 68, y: 435, width: 279, height: 45))
//            passwordLabel.text = "비밀번호 형식을 확인해 주세요"
//            passwordLabel.textColor = UIColor.red
//            passwordLabel.tag = 101
//
//            self.view.addSubview(passwordLabel)
//        } // 비밀번호 형식 오류
        
        if pwd == checkPwd {
            if let removable = self.view.viewWithTag(102) {
                removable.removeFromSuperview()
            }
        }
        else {
            shakeTextField(textField: checkPwdTextField)
            let passwordConfirmLabel = UILabel(frame: CGRect(x: 68, y: 470, width: 279, height: 45))
            passwordConfirmLabel.text = "비밀번호가 다릅니다."
            passwordConfirmLabel.textColor = UIColor.red
            passwordConfirmLabel.tag = 102
            
            self.view.addSubview(passwordConfirmLabel)
        }
        
        if (userModel.name == nameTextField.text) && (userModel.id == idTextField.text) && (userModel.pwd == pwdTextField.text) && pwd == checkPwd {
            
            let joinFail: Bool = isUser(id: id)
            
            if joinFail {
                print("이메일 중복")
                shakeTextField(textField: idTextField)
                let joinFailLabel = UILabel(frame: CGRect(x: 68, y: 510, width: 279, height: 45))
                joinFailLabel.text = "이미 가입된 아이디입니다."
                joinFailLabel.textColor = UIColor.red
                joinFailLabel.tag = 103
                
                self.view.addSubview(joinFailLabel)
            }
            else {
                print("가입 성공")
                if let removable = self.view.viewWithTag(103) {
                    removable.removeFromSuperview()
                }
                self.performSegue(withIdentifier: "showMap", sender: self)
            }
        }
        
        
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
        if nameTextField.isFirstResponder {
            idTextField.becomeFirstResponder()
        }
        else if idTextField.isFirstResponder {
            pwdTextField.becomeFirstResponder()
        }
        else if pwdTextField.isFirstResponder {
            checkPwdTextField.becomeFirstResponder()
        }
    }
    
    // 이름 입력창
    lazy var nameTextField: UITextField! = {
        let nameText = UITextField()
        //        nameText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        nameText.placeholder = "이름"
        nameText.layer.cornerRadius = 5
        nameText.layer.borderWidth = 1
        nameText.layer.borderColor = UIColor.darkGreen?.cgColor
        nameText.borderStyle = .roundedRect
        nameText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return nameText
    }()
    
    // 아이디 입력창
    lazy var idTextField: UITextField! = {
        let idText = UITextField()
        //        idText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        idText.placeholder = "아이디"
        idText.layer.cornerRadius = 5
        idText.layer.borderWidth = 1
        idText.layer.borderColor = UIColor.darkGreen?.cgColor
        idText.borderStyle = .roundedRect
        idText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return idText
    }()
    
    // 비밀번호 입력창
    lazy var pwdTextField: UITextField! = {
        let pwdText = UITextField()
        //        pwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        pwdText.placeholder = "비밀번호"
        pwdText.layer.cornerRadius = 5
        pwdText.layer.borderWidth = 1
        pwdText.layer.borderColor = UIColor.darkGreen?.cgColor
        pwdText.borderStyle = .roundedRect
        pwdText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return pwdText
    }()
    
    // 비밀번호 확인 입력창
    lazy var checkPwdTextField: UITextField! = {
        let checkpwdText = UITextField()
        //        checkpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        checkpwdText.placeholder = "비밀번호 확인"
        checkpwdText.layer.cornerRadius = 5
        checkpwdText.layer.borderWidth = 1
        checkpwdText.layer.borderColor = UIColor.darkGreen?.cgColor
        checkpwdText.borderStyle = .roundedRect
        checkpwdText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return checkpwdText
    }()
    // 돌아가기 버튼
    lazy var backBtn: UIButton = {
        let backButton = UIButton()
        backButton.setTitle("돌아가기", for: .normal)     // 버튼에 들어갈 글씨
        backButton.backgroundColor = .newYellow       // 버튼 색상
        backButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        backButton.layer.cornerRadius = 5
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.darkGreen?.cgColor
        backButton.layer.cornerRadius = (15)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return backButton
    }()
    
    // 저장하기 버튼
    lazy var saveBtn: UIButton = {
        let saveButton = UIButton()
        saveButton.setTitle("저장하기", for: .normal)     // 버튼에 들어갈 글씨
        saveButton.backgroundColor = .newYellow       // 버튼 색상
        saveButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.darkGreen?.cgColor
        saveButton.layer.cornerRadius = (15)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return saveButton
    }()
    
    func setupTextFields() {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, idTextField, pwdTextField, checkPwdTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func loadView() {
        super.loadView()
        view = signUpView
        
        self.view.addSubview(titleView)
        self.view.addSubview(label)
        self.view.addSubview(nameTextField)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwdTextField)
        self.view.addSubview(checkPwdTextField)
        self.view.addSubview(backBtn)
        self.view.addSubview(saveBtn)
        
        
        setupTextFields()
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 100)
        ])
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 170),
        ])
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            nameTextField.widthAnchor.constraint(equalToConstant: 350),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 280),
            idTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            idTextField.widthAnchor.constraint(equalToConstant: 350),
            idTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwdTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 360),
            pwdTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            pwdTextField.widthAnchor.constraint(equalToConstant: 350),
            pwdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        checkPwdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkPwdTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 440),
            checkPwdTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            checkPwdTextField.widthAnchor.constraint(equalToConstant: 350),
            checkPwdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600),
            backBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -80),
            backBtn.widthAnchor.constraint(equalToConstant: 100),
            backBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600),
            saveBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 80),
            saveBtn.widthAnchor.constraint(equalToConstant: 100),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

