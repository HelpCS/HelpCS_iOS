//
//  LoginInfo.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

struct LoginInfo: Codable {
    /*
     id: 아이디
     pwd: 패스워드
     */
    
    init(id: String = "", pwd: String = "") {
        self.id = id
        self.pwd = pwd
    }
    
    var id: String
    var pwd: String
}
