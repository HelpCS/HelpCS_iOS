//
//  extensionVC.swift
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
        vc.navigationController!.navigationBar.barTintColor = UIColor.lightYellow
        vc.navigationController!.navigationBar.isTranslucent = false
        vc.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    @objc func loginBtnPressed(sender: UITapGestureRecognizer) {
        print("LoginView -> MainView")
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
        mainVC.navigationController!.navigationBar.isTranslucent = false
        mainVC.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    @objc func signUpBtnPressed(sender: UITapGestureRecognizer) {
        print("LoginView -> SignUpView")
        let signUpVC = SignUpVC()
        navigationController?.pushViewController(signUpVC, animated: true)
        signUpVC.navigationController!.navigationBar.isTranslucent = false
        signUpVC.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }

}

extension SignUpVC: UITableViewDelegate {
    @objc func backBtnAction() {
        print("로그인 화면으로 돌아가기!")
        navigationController?.popViewController(animated: true)
    }
    @objc func saveAction() {
        print("저장하기!")
        // 저장하기 Action
        navigationController?.popViewController(animated: true)
    }
}
