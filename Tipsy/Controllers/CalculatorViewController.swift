//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = ""
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttontitle = sender.currentTitle!
        
        let buttonTitleMinusPCTSign = String(buttontitle.dropLast())
        
        let buttontitleAsNumber = Double(buttonTitleMinusPCTSign)!
        
        tip = buttontitleAsNumber / 100
        
        let billText = billTextField.text
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
           finalResult = String(format: "%.2f", result)
            
            performSegue(withIdentifier: "goToNext", sender: self)
        }
            
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = finalResult
            destinationVC.numberofP = numberOfPeople
            destinationVC.tipPct = Int(100*tip)
            
            
    }
           
        
        
        
        
    }
    
}
