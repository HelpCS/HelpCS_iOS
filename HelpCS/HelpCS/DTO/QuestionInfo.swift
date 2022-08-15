//
//  questionInfo.swift
//  HelpCS
//
//  Created by 김하은 on 2022/08/15.
//

import Foundation

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
}
