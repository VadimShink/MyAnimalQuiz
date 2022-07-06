//
//  QuestionViewController.swift
//  MyAnimalQuiz
//
//  Created by Vadim Shinkarenko on 04.07.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var myProgressView: UIProgressView!
    @IBOutlet var myQuestionLabel: UILabel!
    @IBOutlet var myRangedSlider: UISlider!
    
    @IBOutlet var mySingleStackView: UIStackView!
    @IBOutlet var myMultipleStackView: UIStackView!
    @IBOutlet var myRangedStackView: UIStackView!
    
    @IBOutlet var mySingleButtons: [UIButton]!
    @IBOutlet var myMultipleLabels: [UILabel]!
    @IBOutlet var myRangeLabels: [UILabel]!
    
    // MARK: - Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}

// MARK: - Private

extension QuestionViewController {
    private func updateUI() {
        // Hide stacks
        for stackView in [mySingleStackView, myMultipleStackView, myRangedStackView] {
            stackView?.isHidden = true
            
        }
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for label
        myQuestionLabel.text = currentQuestion.text
    }
}
