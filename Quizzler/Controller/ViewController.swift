//
//  ViewController.swift
//  Quizzler
//
//  Created by Megavision Technologies on 23/08/19.
//  Copyright © 2019 Megavision. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueBtn: UIButton!
    
    @IBOutlet weak var falseBtn: UIButton!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
            
        }else if sender.tag == 2 {
            pickedAnswer = false
            
        }
        
        checkAnswer()
        
        questionNumber += 1
        updateUI()

    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            print("right")
            score += 1
            
        }
        else {
            ProgressHUD.showError("Wrong!")
            print("wrong")
        }
        
        
    }
    
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].question
            
        }
        else {
            
            let alert = UIAlertController(title: "Awesome", message: "you've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:  { (UIAlertAction) in
                
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }

        
    }
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
        levelLabel.text = String(questionNumber) + "/13"
        
        scoreLabel.text = "Score: " + String(score)
        
        nextQuestion()
        
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        updateUI()
    }
    
}

