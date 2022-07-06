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
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
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
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for progressView
        myProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Show current stackView
        showCurrentStackView(for: currentQuestion.type)
    }
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(for: currentAnswers)
        case .multiple:
            break
        case .range:
            break
        }
    }
    private func showSingleStackView(for answers: [Answer]) {
        mySingleStackView.isHidden = false
        
        for (button, answer) in zip(mySingleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
}
