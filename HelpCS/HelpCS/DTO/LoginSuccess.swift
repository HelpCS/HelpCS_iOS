//
//  LoginSuccess.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

struct LoginSuccess: Codable { // 로그인 성공 여부 판단
    /*
     id: 아이디
     success: 로그인 성공 여부
     */
    
    init(id: String = "", success: Bool = false, name: String = "") {
        self.id = id
        self.success = success
        self.name = name
    }
    
    var id: String
    var success: Bool
    var name: String
}
