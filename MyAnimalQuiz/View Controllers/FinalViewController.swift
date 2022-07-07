//
//  FinalViewController.swift
//  MyAnimalQuiz
//
//  Created by Vadim Shinkarenko on 04.07.2022.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet var myAnimalTypeLabel: UILabel!
    @IBOutlet var myDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        let maxAnimal = getMaxAnimal()
        updateUI(with: maxAnimal)
    }
}

// MARK: - Private Methods

extension FinalViewController {
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: answers, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
    }
    
    private func updateUI(with animal: AnimalType?) {
        myAnimalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐶" )!"
        myDescriptionLabel.text = animal?.definition ?? ""
    }
}
