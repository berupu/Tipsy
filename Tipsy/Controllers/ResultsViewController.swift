//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedResult = ""
    var numberofP = 10
    var tipPct = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(numberofP) people,with \(tipPct)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
       
        self.dismiss(animated: true, completion: nil)
        
    }
}
