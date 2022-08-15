//
//  SignUpView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class SignUpView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        backgroundColor = .lightYellow
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이름 입력창
    lazy var nameTextField: UITextField = {
        let nameText = UITextField()
        nameText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
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
        idText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
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
        pwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
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
        checkpwText.frame = CGRect(x: 65, y: 60, width: 200, height: 30)
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
    
    func makeSubView() {
        addSubview(nameTextField)
        addSubview(idTextField)
        addSubview(pwTextField)
        addSubview(checkPwTextField)
        addSubview(backBtn)
        addSubview(saveBtn)
    }
    
    func makeConstraint() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            nameTextField.widthAnchor.constraint(equalToConstant: 350),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: 80),
            idTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            idTextField.widthAnchor.constraint(equalToConstant: 350),
            idTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwTextField.topAnchor.constraint(equalTo: idTextField.topAnchor, constant: 80),
            pwTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            pwTextField.widthAnchor.constraint(equalToConstant: 350),
            pwTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        checkPwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkPwTextField.topAnchor.constraint(equalTo: pwTextField.topAnchor, constant: 80),
            checkPwTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            checkPwTextField.widthAnchor.constraint(equalToConstant: 350),
            checkPwTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: checkPwTextField.topAnchor, constant: 100),
            backBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            backBtn.widthAnchor.constraint(equalToConstant: 100),
            backBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: checkPwTextField.topAnchor, constant: 100),
            saveBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
            saveBtn.widthAnchor.constraint(equalToConstant: 100),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
