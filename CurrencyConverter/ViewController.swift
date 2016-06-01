//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Pranav Kasetti on 31/05/2016.
//  Copyright © 2016 Pranav Kasetti. All rights reserved.
//

import UIKit
/*
Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination
with, another object. The delegating object keeps a reference to the other object (the delegate) and at an
appropriate time sends a message to it. The message informs the delegate of an event that the delegating object is about to
handle or has just handled. The delegate may respond to the message by updating the appearance or state of itself or other
objects in the application, and in some cases it can return a value that affects how an impending event is handled. The main
value of delegation is that it allows you to customize the behavior of several objects in one central object.
*/
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var poundLabel: UILabel!
    
    @IBOutlet weak var yenLabel: UILabel!
    
    @IBOutlet weak var euroLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func convertCurrency(sender: UIButton) {
        self.inputTextField.resignFirstResponder()
        self.calculateConversions()
    }
    
    @IBAction func clear(sender: AnyObject) {
        inputTextField.text = ""
        self.inputTextField.resignFirstResponder()
        self.calculateConversions()
    }
    
    let poundRate = 0.69
    let yenRate = 113.94
    let euroRate = 0.89
    var dollarAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Called when 'return' key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.calculateConversions()
        return true
    }
    
    // Called when user taps outside the text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        self.calculateConversions()
    }
    
    //MASALA
    
    func calculateConversions() {
        if let amount = Double(inputTextField.text!) {
            dollarAmount = amount
        }
        poundLabel.text = "\(dollarAmount * poundRate)"
        yenLabel.text = "\(dollarAmount * yenRate)"
        euroLabel.text = "\(dollarAmount * euroRate)"
        dollarAmount = 0.0
    }

}

