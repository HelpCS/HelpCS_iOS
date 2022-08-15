//
//  MainVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MainVC: UIViewController {
    let mainView: MainView = {
        let mainView = MainView()
        return mainView
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
    }
}
