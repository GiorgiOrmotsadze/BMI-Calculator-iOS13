//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

//    var bmiValue = "0.0"
    var calculatorBrain  = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hightSliderChanged(_ sender: UISlider) {
        let height = (ceil((sender.value) * 100) / 100)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = ceil(sender.value)
        weightLabel.text = "\(weight)Kg"
            }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
//        let bmi = weight / pow(height, 2)
//        let bmiRounded = ceil(bmi*10) / 10
//        bmiValue = "\(bmiRounded)"
//        print(bmiRounded)
//        print(bmiValue)
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destionationVC = segue.destination as! ResultViewController
            destionationVC.bmiValue = calculatorBrain.getBMIValue()
            destionationVC.advice = calculatorBrain.getAdvice()
            destionationVC.color = calculatorBrain.getColor()
        }
        
    }
}

