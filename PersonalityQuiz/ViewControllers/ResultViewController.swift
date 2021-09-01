//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
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
            frequency[answer] = (frequency[answer] ?? 0) + 1
        }
        
        let descending = frequency.sorted { $0.1 > $1.1 }
        
        let result = descending[0].key
        
        definitionResultLabel.text = result.definition
        emojiResultLabel.text = String(result.rawValue)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
