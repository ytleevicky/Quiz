//
//  ViewController.swift
//  Quiz
//
//  Created by Vicky Lee on 9/1/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if result {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.goToNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI () {
        // Question
        questionLabel.text = quizBrain.getQuestionText()
        
        // Choices
        let mcq = quizBrain.getChoices()
        choiceOneButton.setTitle(mcq[0], for: .normal)
        choiceTwoButton.setTitle(mcq[1], for: .normal)
        choiceThreeButton.setTitle(mcq[2], for: .normal)
        updateProgressBar()
        
        // Score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Reset the buttons
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
    }
    
    func updateProgressBar() {
        progressBar.progress = quizBrain.getProgress()
    }
    
}

