//
//  extensionView.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit
import Lottie

extension MainView {
    // 카테고리 선택하기
    @objc func categoryAction(sender: UITapGestureRecognizer) {
        
    }
    
    // 정답 확인하기
    @objc func oAction(sender: UITapGestureRecognizer) {
        print("O click")
        
    }
    // 정답 확인하기
    @objc func xAction(sender: UITapGestureRecognizer) {
        print("X click")
    }
    // 관련 링크로 연결
    @objc func connectionAction(sender: AnyObject) {
        print("더 알아보기 링크로 연결!")
        if let url = NSURL(string: "https://www.google.com"){
            if #available(iOS 10, *){
                UIApplication.shared.open(url as URL)
            }else{
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
}

extension LoginView {
    @objc func signUpAction(sender: UITapGestureRecognizer) {
        // 회원가입 action -> View 이동
        createSignUp()
    }
    
    @objc func createSignUp() {
        print("회원가입 버튼 클릭")
        // navigation
    }
    
    @objc func confirmAction() {
        print("로그인 화면으로 돌아가기!")
        // navigation
    }
    @objc func loginAction(sender: UITapGestureRecognizer) {
        // 로그인 action -> 로그인 후 View 이동
    }
}
