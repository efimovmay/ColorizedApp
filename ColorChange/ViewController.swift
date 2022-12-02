//
//  ViewController.swift
//  ColorChange
//
//  Created by Aleksey on 30.11.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        setViewColor()
        
        redValue.text = String(format: "%0.2f", redSlider.value)
        greenValue.text = String(format: "%0.2f", greenSlider.value)
        blueValue.text = String(format: "%0.2f", blueSlider.value)

    }

    // MARK: - IBActions
    
    @IBAction func changeRedValue() {
        redValue.text = String(format: "%0.2f", redSlider.value)
        setViewColor()
    }
    
    @IBAction func changeGreenValue() {
        greenValue.text = String(format: "%0.2f", greenSlider.value)
        setViewColor()
    }
    
    @IBAction func changeBlueValue() {
        blueValue.text = String(format: "%0.2f", blueSlider.value)
        setViewColor()
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1.0)
    }
    
}

