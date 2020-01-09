//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Bibie Hadi on 08/01/20.
//  Copyright © 2020 NullNetwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var perfomingMath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        if perfomingMath == true {
            textLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(textLabel.text!)!
            perfomingMath = false
        }else{
            textLabel.text = textLabel.text! + String(sender.tag - 1)
            numberOnScreen = Double(textLabel.text!)!
        }
    }
    
    @IBAction func operators(_ sender: UIButton) {
        if textLabel.text != "" && sender.tag != 16 && sender.tag != 17 {
            previousNumber = Double(textLabel.text!)!
            if sender.tag == 11 {
                textLabel.text = "/"
            } else if sender.tag == 12 {
                textLabel.text = "x"
            } else if sender.tag == 13 {
                textLabel.text = "-"
            } else if sender.tag == 14 {
                textLabel.text = "+"
            } else if sender.tag == 15 {
                textLabel.text = "%"
                let persen = Double(previousNumber / 100)
                textLabel.text = String(persen)
                previousNumber = persen
            }
            operation = sender.tag
            perfomingMath = true
        
        } else if sender.tag == 16 {
            if operation == 11 {
                textLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 {
                textLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 {
                textLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                textLabel.text = String(previousNumber + numberOnScreen)
            }
//            else if operation == 15 {
//
//            }
        } else if sender.tag == 17 {
            textLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
}

