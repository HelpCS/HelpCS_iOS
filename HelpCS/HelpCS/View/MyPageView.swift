//
//  MyPageView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        backgroundColor = .lightYellow
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIImage 보이기
    lazy var myImage: UIImageView = {
        let myImage = UIImageView()
        
        return myImage
    }()
    
    // MyPageView에 있는 List
    lazy var listView : UITextView = {
        let listView = UITextView()
        return listView
    }()
    
    func makeSubView() {
        addSubview(myImage)
        addSubview(listView)
    }
    
    func makeConstraint() {
        myImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            myImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            myImage.widthAnchor.constraint(equalToConstant: 350),
            myImage.heightAnchor.constraint(equalToConstant: 50),
        ])
        listView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: myImage.topAnchor, constant: 80),
            listView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            listView.widthAnchor.constraint(equalToConstant: 350),
            listView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
