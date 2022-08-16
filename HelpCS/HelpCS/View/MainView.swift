//
//  MainView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit
import Lottie

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
        linkConnectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkConnectionBtn.topAnchor.constraint(equalTo: categoryBtn.bottomAnchor, constant: 470),
            linkConnectionBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            linkConnectionBtn.widthAnchor.constraint(equalToConstant: 350),
            linkConnectionBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
