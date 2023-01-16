//
//  ViewController.swift
//  ColorChange
//
//  Created by Aleksey on 30.11.2022.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextFeeld: UITextField!
    @IBOutlet weak var greenTextFeeld: UITextField!
    @IBOutlet weak var blueTextFeeld: UITextField!
    
    // MARK: -  Properties
    
    var colorHomeScreen: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = colorHomeScreen
        sendColorInSlider()
    }

    // MARK: - IBActions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setViewColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextFeeld.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextFeeld.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextFeeld.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        guard let newColor = colorView.backgroundColor else { return }
        delegate.setNewBackground(newColor)
        self.dismiss(animated: true)
    }
    
    //MARK: - Private method
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1.0)
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func sendColorInSlider () {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        colorHomeScreen.getRed(&red,
                               green: &green,
                               blue: &blue,
                               alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }

}

