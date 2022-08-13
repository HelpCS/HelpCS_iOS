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
    
    // + 버튼
    lazy var plusBtn: UIButton = {
        let plusBtn = UIButton()
        plusBtn.setTitle("+", for: .normal)     // 버튼에 들어갈 글씨
        plusBtn.backgroundColor = .white       // 버튼 색상
        plusBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.addTarget(self, action: #selector(oAction), for: .touchUpInside)
        return plusBtn
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
        oBtn.backgroundColor = .white     // 버튼 색상
        oBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        oBtn.addTarget(self, action: #selector(oAction), for: .touchUpInside)
        return oBtn
    }()
    
    // X 버튼 -> UIImage 변경 필요
    lazy var xBtn: UIButton = {
        let xBtn = UIButton()
        xBtn.setTitle("X", for: .normal)     // 버튼에 들어갈 글씨
        xBtn.backgroundColor = .white      // 버튼 색상
        xBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        xBtn.addTarget(self, action: #selector(xAction), for: .touchUpInside)
        return xBtn
    }()
    
    // 더 알아보기 버튼 -> UIImage 변경 필요
    lazy var linkConnectionBtn: UIButton = {
        let connectionBtn = UIButton()
        connectionBtn.setTitle("더 알아보기", for: .normal)     // 버튼에 들어갈 글씨
        connectionBtn.backgroundColor = .white       // 버튼 색상
        connectionBtn.setTitleColor(.darkGreen, for: .normal) // 버튼 글씨 색상
        connectionBtn.translatesAutoresizingMaskIntoConstraints = false
        connectionBtn.addTarget(self, action: #selector(connectionAction), for: .touchUpInside)
        return connectionBtn
    }()
    
    func makeSubView() {
        addSubview(plusBtn)
        addSubview(questionText)
        addSubview(oBtn)
        addSubview(xBtn)
        addSubview(linkConnectionBtn)
    }
    
    func makeConstraint() {
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            plusBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            plusBtn.widthAnchor.constraint(equalToConstant: 50),
            plusBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        questionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
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
            linkConnectionBtn.topAnchor.constraint(equalTo: oBtn.topAnchor, constant: 90),
            linkConnectionBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            linkConnectionBtn.widthAnchor.constraint(equalToConstant: 350),
            linkConnectionBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
