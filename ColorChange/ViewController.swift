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

    }

    // MARK: - IBActions
    
    @IBAction func changeRedValue() {
        
        redValue.text = "\(redSlider.value)"
        setViewColor()
    }
    
    @IBAction func changeGreenValue() {
        
        setViewColor()
    }
    
    @IBAction func changeBlueValue() {
        
        setViewColor()
        
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1.0)
    }
    
}

