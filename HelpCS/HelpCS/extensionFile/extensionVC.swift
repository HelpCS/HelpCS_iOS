//
//  extensionVC.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/13.
//

import UIKit
import Lottie

extension UIColor {
    class var lightGreen: UIColor? { return UIColor(named: "lightGreen")}
    class var lightYellow: UIColor? { return UIColor(named: "lightYellow")}
    class var newYellow: UIColor? { return UIColor(named: "newYellow")}
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
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let id = mainIdTextField.text, !id.isEmpty else { return }
        guard let pwd = mainPwdTextField.text, !pwd.isEmpty else { return }
            
//        if userModel.isValidEmail(id: id){
//            if let removable = self.view.viewWithTag(100) {
//                removable.removeFromSuperview()
//            }
//        }
//        else {
//            shakeTextField(textField: mainIdTextField)
//            let idLabel = UILabel(frame: CGRect(x: 68, y: 350, width: 279, height: 45))
//            idLabel.text = "아이디 형식을 확인해 주세요"
//            idLabel.textColor = UIColor.red
//            idLabel.tag = 100
//
//            self.view.addSubview(idLabel)
//        } // 이메일 형식 오류
//
//        if userModel.isValidPassword(pwd: pwd){
//            if let removable = self.view.viewWithTag(101) {
//                removable.removeFromSuperview()
//            }
//        }
//        else{
//            shakeTextField(textField: mainIdTextField)
//            let pwdLabel = UILabel(frame: CGRect(x: 68, y: 435, width: 279, height: 45))
//            pwdLabel.text = "비밀번호 형식을 확인해 주세요"
//            pwdLabel.textColor = UIColor.red
//            pwdLabel.tag = 101
//
//            self.view.addSubview(pwdLabel)
//        } // 비밀번호 형식 오류
        
//        if (loginInfo.id == mainIdTextField.text) && (loginInfo.pwd == mainPwdTextField.text) {
//            let loginSuccess: Bool = loginCheck(id: loginInfo.id, pwd: loginInfo.pwd)
//            if loginSuccess {
//                print("로그인 성공")
//                if let removable = self.view.viewWithTag(102) {
//                    removable.removeFromSuperview()
//                }
//                self.performSegue(withIdentifier: "showMain", sender: self)
//            }
//            else {
//                print("로그인 실패")
//                shakeTextField(textField: mainIdTextField)
//                shakeTextField(textField: mainPwdTextField)
//                let loginFailLabel = UILabel(frame: CGRect(x: 68, y: 510, width: 279, height: 45))
//                loginFailLabel.text = "아이디나 비밀번호가 다릅니다."
//                loginFailLabel.textColor = UIColor.red
//                loginFailLabel.tag = 102
//                    
//                self.view.addSubview(loginFailLabel)
//            }
//        }
    } // end of didTapLoginButton

}
extension MainVC: UITableViewDelegate {
    // 카테고리 선택하기
    @objc func categoryAction(sender: UITapGestureRecognizer) {
        
    }
    
    // 정답 확인하기
    @objc func oAction(sender: UITapGestureRecognizer) {
        print("O click")
        
        if (question.answer == "O") {
            failView.play()
        } else {
            correctView.play()
        }
    }
    // 정답 확인하기
    @objc func xAction(sender: UITapGestureRecognizer) {
        print("X click")
        
        if (question.answer == "X") {
            correctView.play()
        } else {
            failView.play()
        }
    }
    
    // 관련 링크로 연결
    @objc func connectionAction(sender: AnyObject) {
        print("더 알아보기 링크로 연결!")
//        "\(question.questionUrl)"
        if let url = NSURL(string: "https://www.google.com"){
            if #available(iOS 10, *){
                UIApplication.shared.open(url as URL)
            }else{
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
}

extension SignUpVC: UITableViewDelegate {
    @objc func backBtnAction() {
        print("로그인 화면으로 돌아가기!")
        navigationController?.popViewController(animated: true)
    }
    // 서버로 저장한 내용 보내기!
    @objc func saveAction() {
        print("저장하기!")
        // 저장하기 Action
        validateForm()
        navigationController?.popViewController(animated: true)
    }
    
    func validateForm() {
        guard let nameText = nameTextField.text, !nameText.isEmpty else { return }
        guard let idText = idTextField.text, !idText.isEmpty else { return }
        guard let pwdText = pwdTextField.text, !pwdText.isEmpty else { return }
        guard let checkPwdText = checkPwdTextField.text, !checkPwdText.isEmpty else { return }
        
        startSigningUp(name: nameText, id: idText, pwd: pwdText)
    }
    
    func startSigningUp(name: String, id: String, pwd: String) {
        print("Please call any Sign up api for registration: ", name, id, pwd)
    }
}
