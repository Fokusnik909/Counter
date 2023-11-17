//
//  ViewController.swift
//  Counter
//
//  Created by Артур  Арсланов on 17.11.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    var counter = 1111 {
        didSet {
            countLabel.text = "\(counter)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = UIImage.SymbolConfiguration(pointSize: 26)
        let image = UIImage(systemName: "arrow.circlepath",withConfiguration: config)
        resetButton.setImage(image, for: .normal)
        
        let cornerRadiusButton = plusButton.frame.width / 2
        
        plusButton.layer.cornerRadius = cornerRadiusButton
        minusButton.layer.cornerRadius = cornerRadiusButton
    
    }

    @IBAction func plusButtonPressed(_ sender: Any) {
        counter += 111
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        if counter > 0 {
            counter -= 1
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        counter = 0
    }
    

}

