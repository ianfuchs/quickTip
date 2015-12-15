//
//  ViewController.swift
//  quickTip
//
//  Created by Ian Fuchs on 12/9/15.
//  Copyright © 2015 RedFox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
  
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.delegate = self
        billField.keyboardType = .DecimalPad
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
    
        var tipPercentages = [0.1, 0.15, 0.2, 0.25]
    
        var tipChoice = tipPercentages[tipControl.selectedSegmentIndex]

        var tip = 0.00
        var total = 0.00
        
//        var billAmount : Double {
//            if billField == nil {
//                return 0.00
//            } else if billField.text == "" {
//                return 0.00
//            } else {
//                return Double(billField.text!)!
//            }
//        }
        
        
        var billAmount : Double {
            if let billAmount = Double(billField.text!) {
//                print("\(billAmount) is a number")
                return abs(Double(billField.text!)!)
            } else {
//                print("that's not a number, bro")
                return 0.0
            }
        }

        
// here's my funny stuff
        
        func roughTip() -> Double {
            let roughTotal = (billAmount * tipChoice)
            return(roughTotal)
        }
        
        let roughTipTotal = roughTip()
        
        func finalTotal() -> Double {
            let bottomTotal = round(billAmount + roughTipTotal)
            return(bottomTotal)
        }
        
        let finalTotalRound = finalTotal()
        
        let tipTotal = (finalTotalRound - billAmount)
        
        
//        let finalTipPer = Double(round((tipTotal / billAmount)*100)/100)
//        
//        let fullTipPer = (tipTotal / billAmount)
      
        tip = tipTotal

        
        total = finalTotalRound
        
// and back to live action
        
       //tip = (billAmount * tipChoice)
        

        //total = (billAmount + tip)

        print("\(billAmount)")
        print("\(tip)")
        print("\(total)")
        
//        tipLabel.text = "Some tip"

//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.02f", tip)
        totalLabel.text = String(format: "$%.02f", total)
    }

}

