//
//  SigninInfo.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

struct SignUpInfo: Codable {
    /*
     name: 이름
     id: 아이디
     pwd: 패스워드
     checkpwd: 패스워드 확인
     */
    
    init(name: String = "", id: String = "", pwd: String = "", checkpwd: String = "") {
        self.name = name
        self.id = id
        self.pwd = pwd
        self.checkpwd = checkpwd
    }
    
    var name: String
    var id: String
    var pwd: String
    var checkpwd: String
}
