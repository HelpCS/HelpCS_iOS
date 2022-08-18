//
//  MainVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit
import Lottie

class MainVC: UIViewController {
    let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .lightYellow
        return mainView
    }()
    
    let correctView: AnimationView = {
        let animationView = AnimationView(name: "correct")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1
        return animationView
    }()
    
    let failView: AnimationView = {
        let animationView = AnimationView(name: "fail")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1
        return animationView
    }()
    
    var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGreen
        return view
    }()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
    
    lazy var myPageBtn: UIButton = {
        let myPageBtn = UIButton()
        // 로그아웃 버튼
        myPageBtn.setImage(UIImage.init(systemName: "person.crop.circle.badge.xmark"), for: .normal)
        myPageBtn.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        // MyPage 이동하기 위한 버튼
//        myPageBtn.addTarget(self, action: #selector(myPageBtnPressed), for: .touchUpInside)
//        myPageBtn.setImage(UIImage.init(systemName: "person.circle"), for: .normal)
        myPageBtn.tintColor = .black
        return myPageBtn
    }()
    
    @objc func logOutAction(sender: UITapGestureRecognizer) {
        let vc = ViewController()
        // 값을 없애는 작업 필요
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func myPageBtnPressed() {
//        let vc = MyPageVC()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    var personalData = LoginInfo()
    var question = QuestionInfo()
    
    // category 버튼
    lazy var categoryBtn: UIButton = {
        let categoryBtn = UIButton()
        categoryBtn.setTitle("\(personalData.id) 의 \(question.questionTitle) 문제", for: .normal)     // 버튼에 들어갈 글씨
        categoryBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        categoryBtn.backgroundColor = .newYellow     // 버튼 색상
        categoryBtn.layer.cornerRadius = 5
        categoryBtn.layer.borderWidth = 1
        categoryBtn.layer.borderColor = UIColor.newYellow?.cgColor
        categoryBtn.layer.cornerRadius = (10)
        categoryBtn.addTarget(self, action: #selector(categoryAction), for: .touchUpInside)
        return categoryBtn
    }()
    
    // 기능추가 필요
    lazy var questionText: UITextView = {
        let questionText = UITextView()
//        questionText.text = URL(string: "(\(question.question))")
        questionText.text = "문제"
        questionText.textColor = .darkGreen
        questionText.textAlignment = .center
        questionText.layer.cornerRadius = (15)
        questionText.layer.cornerRadius = 5
        questionText.layer.borderWidth = 1
        questionText.layer.borderColor = UIColor.darkGreen?.cgColor
        questionText.isScrollEnabled = false
        questionText.isSelectable = false
        questionText.isEditable = false
        return questionText
    }()
    
    // 더 알아보기 버튼
    lazy var linkConnectionBtn: UIButton = {
        let connectionBtn = UIButton()
        connectionBtn.setTitle("더 알아보기", for: .normal)     // 버튼에 들어갈 글씨
        connectionBtn.backgroundColor = .white       // 버튼 색상
        connectionBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        connectionBtn.layer.cornerRadius = 5
        connectionBtn.layer.borderWidth = 1
        connectionBtn.layer.borderColor = UIColor.darkGreen?.cgColor
        connectionBtn.layer.cornerRadius = (15)
        connectionBtn.translatesAutoresizingMaskIntoConstraints = false
        connectionBtn.addTarget(self, action: #selector(connectionAction), for: .touchUpInside)
        return connectionBtn
    }()
    
    // O 버튼
    lazy var oBtn: UIButton = {
        let oBtn = UIButton()
        oBtn.setTitle("O", for: .normal)     // 버튼에 들어갈 글씨
        oBtn.backgroundColor = .white     // 버튼 색상
        oBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        oBtn.layer.cornerRadius = 5
        oBtn.layer.borderWidth = 1
        oBtn.layer.borderColor = UIColor.darkGreen?.cgColor
        oBtn.layer.cornerRadius = (15)
        oBtn.addTarget(self, action: #selector(oAction), for: .touchUpInside)
        return oBtn
    }()
    
    // X 버튼
    lazy var xBtn: UIButton = {
        let xBtn = UIButton()
        xBtn.setTitle("X", for: .normal)     // 버튼에 들어갈 글씨
        xBtn.backgroundColor = .white      // 버튼 색상
        xBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        xBtn.layer.cornerRadius = 5
        xBtn.layer.borderWidth = 1
        xBtn.layer.borderColor = UIColor.darkGreen?.cgColor
        xBtn.layer.cornerRadius = (15)
        xBtn.addTarget(self, action: #selector(xAction), for: .touchUpInside)
        return xBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "오늘의 문제"
        label.text = "오늘의 문제"
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
        
        self.view.addSubview(titleView)
        self.view.addSubview(myPageBtn)
        self.view.addSubview(label)
        self.view.addSubview(questionText)
        self.view.addSubview(categoryBtn)
        self.view.addSubview(linkConnectionBtn)
        self.view.addSubview(correctView)
        self.view.addSubview(failView)
        self.view.addSubview(oBtn)
        self.view.addSubview(xBtn)
        
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
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 150),
        ])
        myPageBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPageBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            myPageBtn.leadingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            myPageBtn.heightAnchor.constraint(equalToConstant: 40),
            myPageBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        correctView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            correctView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            correctView.topAnchor.constraint(equalTo: categoryBtn.bottomAnchor, constant: 30),
            correctView.widthAnchor.constraint(equalToConstant: 350),
            correctView.heightAnchor.constraint(equalToConstant: 350)
        ])
        failView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            failView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            failView.topAnchor.constraint(equalTo: categoryBtn.bottomAnchor, constant: 30),
            failView.widthAnchor.constraint(equalToConstant: 350),
            failView.heightAnchor.constraint(equalToConstant: 350)
        ])
        categoryBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            categoryBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            categoryBtn.widthAnchor.constraint(equalToConstant: 250),
            categoryBtn.heightAnchor.constraint(equalToConstant: 30),
        ])
        questionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionText.topAnchor.constraint(equalTo: categoryBtn.bottomAnchor, constant: 30),
            questionText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            questionText.widthAnchor.constraint(equalToConstant: 350),
            questionText.heightAnchor.constraint(equalToConstant: 350),
        ])
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oBtn.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 40),
            oBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -90),
            oBtn.widthAnchor.constraint(equalToConstant: 150),
            oBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xBtn.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 40),
            xBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 90),
            xBtn.widthAnchor.constraint(equalToConstant: 150),
            xBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        linkConnectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkConnectionBtn.topAnchor.constraint(equalTo: oBtn.bottomAnchor, constant: 40),
            linkConnectionBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            linkConnectionBtn.widthAnchor.constraint(equalToConstant: 350),
            linkConnectionBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
