//
//  Question.swift
//  Quiz
//
//  Created by Vicky Lee on 9/1/2022.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let actualAnswer: String
    
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        actualAnswer = correctAnswer
    }
}
