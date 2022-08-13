//
//  SignUpVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class SignUpVC: UIViewController {
    let signUpView: SignUpView = {
        let signUpView = SignUpView()
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
        signUpView.backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        signUpView.saveBtn.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = signUpView
        
        self.view.addSubview(titleView)
        self.view.addSubview(label)
        
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
    }
}
