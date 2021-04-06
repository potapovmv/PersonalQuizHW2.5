//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    @IBOutlet weak var resultCharatersLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var answers: [Answer] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        answersResult()
    }
    
    private func answersResult() {
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        let animalTypeText = AnimalTypeText()
        let animalTypeImage = AnimalTypeImage()
        for i in 0...answers.count - 1 {
            switch answers[i].type {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            default:
                turtle += 1
            }
        }
        if dog > cat && dog > rabbit && dog > turtle {
            resultCharatersLabel.text = "Вы - \(animalTypeImage.dog)"
            resultTextLabel.text = "\(animalTypeText.dog)"
        } else if cat > dog && cat > rabbit && cat > turtle {
            resultCharatersLabel.text = "Вы - \(animalTypeImage.cat)"
            resultTextLabel.text = "\(animalTypeText.cat)"
        } else if rabbit > dog && rabbit > cat && rabbit > turtle {
            resultCharatersLabel.text = "Вы - \(animalTypeImage.rabbit)"
            resultTextLabel.text = "\(animalTypeText.rabbit)"
        } else {
            resultCharatersLabel.text = "Вы - \(animalTypeImage.turtle)"
            resultTextLabel.text = "\(animalTypeText.turtle)"
        }
    }
}
