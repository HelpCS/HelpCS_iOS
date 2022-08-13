//
//  extensionFile.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit

extension UIColor {
    class var lightGreen: UIColor? { return UIColor(named: "lightGreen")}
    class var lightYellow: UIColor? { return UIColor(named: "lightYellow")}
    class var darkGreen: UIColor? { return UIColor(named: "darkGreen")}
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginBtnPressed(sender: UITapGestureRecognizer) {
        print("LoginView -> MainView")
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc func signUpBtnPressed(sender: UITapGestureRecognizer) {
        print("LoginView -> SignUpView")
        let signUpVC = SignUpVC()
        navigationController?.pushViewController(signUpVC, animated: true)
    }

}
extension MainVC: UITableViewDelegate {
    @objc func plusBtnPressed(sender: UITapGestureRecognizer) {
        print("MainVC -> myPageView")
        let myPageVC = MyPageVC()
        navigationController?.pushViewController(myPageVC, animated: true)
    }
}

extension SignUpVC: UITableViewDelegate {
    @objc func loginBtnPressed(sender: UITapGestureRecognizer) {
        print("SignUpView -> LoginView")
        navigationController?.popViewController(animated: true)
    }
}
extension MainView {
    @objc func oAction(sender: UITapGestureRecognizer) {
        // 정답 확인하기
    }
    
    @objc func xAction(sender: UITapGestureRecognizer) {
        // 정답 확인하기
    }
    
    @objc func connectionAction(sender: UITapGestureRecognizer) {
        // 관련 링크로 연결
    }
}

extension SignUpView {
    @objc func loginAction() {
        print("로그인 화면으로 돌아가기!")
        // navigation
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

extension MyPageView {
    
}
