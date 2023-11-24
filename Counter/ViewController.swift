//
//  ViewController.swift
//  Counter
//
//  Created by Артур  Арсланов on 17.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var counter = 0 {
        didSet {
            countLabel.text = "\(counter)"
        }
    }

     override func viewDidLoad() {
        super.viewDidLoad()
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        let image = UIImage(systemName: "arrow.circlepath",withConfiguration: config)
        resetButton.setImage(image, for: .normal)
        
        let cornerRadiusButton = plusButton.frame.width / 2
        
        plusButton.layer.cornerRadius = cornerRadiusButton
        minusButton.layer.cornerRadius = cornerRadiusButton
        
        historyTextView.text = "История изменений:"
        
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    
    }

    @IBAction private func plusButtonPressed(_ sender: Any) {
        counter += 1
        let dateString = dateHistory()
        historyTextView.text += "\n [\(dateString)]: значение изменено на +1  "
    }
    
    @IBAction private func minusButtonPressed(_ sender: Any) {
        let dateString = dateHistory()
        if counter > 0 {
            counter -= 1
            historyTextView.text += "\n [\(dateString)]: значение изменено на -1 "
        }else {
            historyTextView.text += "\n [\(dateString)]: попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func resetButtonPressed(_ sender: Any) {
        counter = 0
        let dateString = dateHistory()
        historyTextView.text += "\n [\(dateString)]: значение сброшено "
    }
    
    private func dateHistory() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    

}

