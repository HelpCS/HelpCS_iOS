//
//  SignUpSuccess.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

struct SignUpSuccess: Codable {
    /*
     id: 아이디
     success: 회원가입 성공 여부
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

