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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case pwd
    }
}

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
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id, pwd, checkpwd
    }
}

struct QuestionInfo: Codable { // 로그인 성공 여부 판단
    /*
     id : 문제 번호
     questionTitle : 문제 제목
     question : 문제 설명
     answer : (user가 푼) 문제 답
     questionUrl : 문제 답안 및 관련 링크
     */
    
    init(id: String = "", questionTitle: String = "", question: String = "", answer: String = "", questionUrl: String = "") {
        self.id = id
        self.questionTitle = questionTitle
        self.question = question
        self.answer = answer
        self.questionUrl = questionUrl
    }
    
    var id: String
    var questionTitle: String
    var question: String
    var answer: String
    var questionUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case questionTitle, question, answer, questionUrl
    }
}
