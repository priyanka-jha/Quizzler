//
//  Questions.swift
//  Quizzler
//
//  Created by Megavision Technologies on 23/08/19.
//  Copyright © 2019 Megavision. All rights reserved.
//

import Foundation

class Question {
    
    let question : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        question = text
        answer = correctAnswer
    }
    
   
}

