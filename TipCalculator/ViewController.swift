//
//  ViewController.swift
//  TipCalculator
//
//  Created by Javier Bustillo on 12/14/15.
//  Copyright © 2015 Javier Bustillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
     @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var defaultOutlet: UISegmentedControl!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
       
        
    }
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("String")
        tipControl.selectedSegmentIndex = intValue
        
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        
        
        let billAmount = NSString(string: BillField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = tip + billAmount
        
        TipLabel.text = "$\(tip)"
        TotalLabel.text = "$\(total)"
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        
       
        let billAmount = NSString(string: BillField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = tip + billAmount
        
        TipLabel.text = "$\(tip)"
        TotalLabel.text = "$\(total)"
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
}

