//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var emojiResultLabel: UILabel!
    @IBOutlet var definitionResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        maximumTypeCalculation()
    }
    
    func maximumTypeCalculation() {
        var frequency: [Animal:Int] = [:]
        let answersAnimal = answersChosen.map{ $0.animal }
        
        for answer in answersAnimal {
            if let count = frequency[answer] {
                frequency[answer] = count + 1
            } else {
                frequency[answer] = 1
            }
        }
        
        let descending = frequency.sorted { $0.1 > $1.1 }
        
        let result = descending[0].key
        
        definitionResultLabel.text = result.definition
        emojiResultLabel.text = "Вы — " + String(result.rawValue)
    }

}
