//
//  MyPageVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MyPageVC: UIViewController {
    let myPageView: UIView = {
        let myPageView = UIView()
        myPageView.backgroundColor = .lightYellow
        return myPageView
    }()
    
    var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightGreen
        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backbutton), for: .touchUpInside)
        button.setImage(UIImage.init(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
    
    // UIImage 보이기
    lazy var myImage: UIImageView = {
        let myImage = UIImageView()
        myImage.backgroundColor = .white
        myImage.image = UIImage(named: "helpCSLogo")
        myImage.contentMode = .scaleAspectFill
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = 50
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor.darkGreen?.cgColor
        myImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        myImage.layer.shadowOpacity = 0.7
        myImage.layer.shadowRadius = 5
        myImage.layer.shadowColor = UIColor.lightGreen?.cgColor
        
        return myImage
    }()
    
    // 로그아웃 버튼
    lazy var logOutBtn: UIButton = {
        let logOutButton = UIButton()
        logOutButton.setTitle("로그아웃", for: .normal)     // 버튼에 들어갈 글씨
        logOutButton.backgroundColor = .white       // 버튼 색상
        logOutButton.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        logOutButton.layer.cornerRadius = 5
        logOutButton.layer.borderWidth = 1
        logOutButton.layer.borderColor = UIColor.darkGreen?.cgColor
        logOutButton.layer.cornerRadius = (15)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        return logOutButton
    }()
    
    @objc func backbutton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func logOutAction(sender: UITapGestureRecognizer) {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "내 정보 확인하기"
        label.text = "내 정보 확인하기"
    }
    
    override func loadView() {
        super.loadView()
        view = myPageView
        
        self.view.addSubview(titleView)
        self.view.addSubview(button)
        self.view.addSubview(label)
        self.view.addSubview(logOutBtn)
        self.view.addSubview(myImage)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 100)
        ])
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 150),
        ])
        myImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 100),
            myImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            myImage.widthAnchor.constraint(equalToConstant: 200),
            myImage.heightAnchor.constraint(equalToConstant: 200),
        ])
        logOutBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutBtn.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 80),
            logOutBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            logOutBtn.widthAnchor.constraint(equalToConstant: 350),
            logOutBtn.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
