//
//  ViewController.swift
//  Counter
//
//  Created by Kislov Vadim on 12.11.2025.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var changeHistoryTextView: UITextView!
    
    private var count: Int = 0 {
        willSet {
            countLabel.text = String(newValue)
        }
    }
    
    private var currentDateTime: String {
        Date.now.formatted(date: .numeric, time: .standard)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeHistoryTextView.text = "История изменений: \n"
    }

    @IBAction private func didTapIncrementButton() {
        count += 1
        
        changeHistoryTextView.text += "[\(currentDateTime)]: значение изменено на +1 \n"
    }
    
    @IBAction private func didTapDecrementButton() {
        if count == 0 {
            changeHistoryTextView.text += "[\(currentDateTime)]: попытка уменьшить значение счётчика ниже 0 \n"
            
            return
        }
        
        count -= 1
        
        changeHistoryTextView.text += "[\(currentDateTime)]: значение изменено на -1 \n"
    }
    
    @IBAction private func didTapResetButton() {
        count = 0
        
        changeHistoryTextView.text += "[\(currentDateTime)]: значение сброшено \n"
    }
}
