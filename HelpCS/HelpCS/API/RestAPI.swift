//
//  RestAPI.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

class RestAPI {
    let sync_que = DispatchQueue.global()
    let sync_group = DispatchGroup.init()
    
    // 회원가입 정보 보내고 성공 여부 리턴하기
    func GET_Signup(member: SignUpInfo) -> SignUpSuccess {
        var db = SignUpSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/signup_confirm?" +
                        "id=" + member.id +
                        "&pwd=" + member.pwd +
                        "&SN=" + member.name) {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(SignUpSuccess.self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 로그인 성공 여부 리턴
    func GET_Login(member: LoginInfo) -> LoginSuccess {
        var db = LoginSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/login_confirm?" +
                            "id=" + member.id +
                            "&pwd=" + member.pwd){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            DispatchQueue.global().sync {
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else { return }

                    
                    // get
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(LoginSuccess.self, from: data) {
                        db = json
                        print("LoginSuccess", db)
                    }
                }.resume()
            }
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 문제 정보 가져오기 -> member 별로 가져올 수 있는지 확인하기 
    func GET_Question() -> QuestionInfo {
        var db = QuestionInfo.init()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(QuestionInfo.self, from: data) {
                    db = json
                }
            }.resume()
        }
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
}
