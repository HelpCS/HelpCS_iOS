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
        
    }
    
    // 이름 입력창
    lazy var nameTextField: UITextField = {
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
    lazy var idTextField: UITextField = {
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
    lazy var pwTextField: UITextField = {
        let pwText = UITextField()
//        pwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        pwText.placeholder = "비밀번호"
        pwText.layer.cornerRadius = 5
        pwText.layer.borderWidth = 1
        pwText.layer.borderColor = UIColor.darkGreen?.cgColor
        pwText.borderStyle = .roundedRect
        pwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return pwText
    }()
    
    // 비밀번호 확인 입력창
    lazy var checkPwTextField: UITextField = {
        let checkpwText = UITextField()
//        checkpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
        checkpwText.placeholder = "비밀번호 확인"
        checkpwText.layer.cornerRadius = 5
        checkpwText.layer.borderWidth = 1
        checkpwText.layer.borderColor = UIColor.darkGreen?.cgColor
        checkpwText.borderStyle = .roundedRect
        checkpwText.clearButtonMode = .whileEditing   // 입력하기 위해서 clear한 btn상태
        return checkpwText
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
        let stackView = UIStackView(arrangedSubviews: [nameTextField, idTextField, pwTextField, checkPwTextField])
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
        self.view.addSubview(pwTextField)
        self.view.addSubview(checkPwTextField)
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
            idTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: 80),
            idTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            idTextField.widthAnchor.constraint(equalToConstant: 350),
            idTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwTextField.topAnchor.constraint(equalTo: idTextField.topAnchor, constant: 80),
            pwTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            pwTextField.widthAnchor.constraint(equalToConstant: 350),
            pwTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        checkPwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkPwTextField.topAnchor.constraint(equalTo: pwTextField.topAnchor, constant: 80),
            checkPwTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            checkPwTextField.widthAnchor.constraint(equalToConstant: 350),
            checkPwTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: checkPwTextField.topAnchor, constant: 100),
            backBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -80),
            backBtn.widthAnchor.constraint(equalToConstant: 100),
            backBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: checkPwTextField.topAnchor, constant: 100),
            saveBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 80),
            saveBtn.widthAnchor.constraint(equalToConstant: 100),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
