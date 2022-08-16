//
//  MainVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit
import Lottie

class MainVC: UIViewController {
    let mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    let animationView: UIView = {
        let animationView = AnimationView(name: "104751-correct")
        animationView.contentMode = .scaleAspectFit
        animationView.play()
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
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func myPageBtnPressed() {
        let vc = MyPageVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
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
        self.view.addSubview(oBtn)
        self.view.addSubview(xBtn)
        self.view.addSubview(animationView)
        
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
        oBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 510),
            oBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -90),
            oBtn.widthAnchor.constraint(equalToConstant: 150),
            oBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 510),
            xBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 90),
            xBtn.widthAnchor.constraint(equalToConstant: 150),
            xBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}
