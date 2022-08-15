//
//  MainView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        backgroundColor = .lightYellow
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // category 버튼
    lazy var categoryBtn: UIButton = {
        let categoryBtn = UIButton()
        categoryBtn.setTitle("user 의 "+"category 문제", for: .normal)     // 버튼에 들어갈 글씨
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
//        questionText.text = URL(string: "문제url")
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
    
    func makeSubView() {
        addSubview(questionText)
        addSubview(categoryBtn)
        addSubview(oBtn)
        addSubview(xBtn)
        addSubview(linkConnectionBtn)
    }
    
    func makeConstraint() {
        categoryBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            categoryBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            categoryBtn.widthAnchor.constraint(equalToConstant: 250),
            categoryBtn.heightAnchor.constraint(equalToConstant: 30),
        ])
        questionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionText.topAnchor.constraint(equalTo: categoryBtn.bottomAnchor, constant: 30),
            questionText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            questionText.widthAnchor.constraint(equalToConstant: 350),
            questionText.heightAnchor.constraint(equalToConstant: 350),
        ])
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oBtn.topAnchor.constraint(equalTo: questionText.topAnchor, constant: 400),
            oBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -90),
            oBtn.widthAnchor.constraint(equalToConstant: 150),
            oBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xBtn.topAnchor.constraint(equalTo: questionText.topAnchor, constant: 400),
            xBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 90),
            xBtn.widthAnchor.constraint(equalToConstant: 150),
            xBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        linkConnectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkConnectionBtn.topAnchor.constraint(equalTo: oBtn.bottomAnchor, constant: 40),
            linkConnectionBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            linkConnectionBtn.widthAnchor.constraint(equalToConstant: 350),
            linkConnectionBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
