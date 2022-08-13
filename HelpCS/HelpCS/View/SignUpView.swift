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
        signloginButton.backgroundColor = .white       // 버튼 색상
        signloginButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        signloginButton.translatesAutoresizingMaskIntoConstraints = false
        signloginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return signloginButton
    }()
    
    func makeSubView() {
        addSubview(nameTextField)
        addSubview(idTextField)
        addSubview(pwTextField)
        addSubview(checkPwTextField)
        addSubview(signloginBtn)
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
        signloginBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signloginBtn.topAnchor.constraint(equalTo: checkPwTextField.topAnchor, constant: 100),
            signloginBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            signloginBtn.widthAnchor.constraint(equalToConstant: 100),
            signloginBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
