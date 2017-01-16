//
//  ViewController.swift
//  MyUtilityApp
//
//  Created by Student on 2016-11-24.
//  Copyright © 2016 matias Kahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var friendNames: [UITextField]!
    
    @IBOutlet var amountsOwed: [UITextField]!
    
    // A place to store all of the loans I have made.
    var loans : [Loan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    override func viewDidLayoutSubviews() {
        // Make it so that each time a text box is edited, the contents of all text boxes are saved
        for subview in self.view.subviews {
            if let textField = subview as? UITextField {
                textField.addTarget(self, action: #selector(self.saveAmountOwed), for: .editingChanged)
                
            }
        }
        
        // Initialize the loans array with an empty set of loans
        for _ in 0...4 {
            loans.append(Loan(name: "", amount: 0))
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveAmountOwed() {
        
        // Saves all the names
        print("about to list all the friends")
        for (position, friendName) in friendNames.enumerated() {
            
            if let name = friendName.text {
                loans[position].name = name
                
            }
            
        }
        
        // Saves all the loan amounts
        for (position, amountOwed) in amountsOwed.enumerated() {
            
            if let amount = Double(amountOwed.text!) {
                loans[position].amount = amount
            }
        }
    }

}


