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
        
        redTextFeeld.delegate = self
        greenTextFeeld.delegate = self
        blueTextFeeld.delegate = self
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = colorHomeScreen
        
        sendColorInSlider()
        sendColorFromSliders(redSlider)
        sendColorFromSliders(greenSlider)
        sendColorFromSliders(blueSlider)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IBActions
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        guard let newColor = colorView.backgroundColor else { return }
        delegate.setNewBackground(newColor)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendColorFromSliders(_ sender: UISlider) {
        setViewColor()
        switch sender {
        case redSlider:
            redLabel.text = getString(from: redSlider)
            redTextFeeld.text = getString(from: redSlider)
        case greenSlider:
            greenLabel.text = getString(from: greenSlider)
            greenTextFeeld.text = getString(from: greenSlider)
        default:
            blueLabel.text = getString(from: blueSlider)
            blueTextFeeld.text = getString(from: blueSlider)
        }
    }
    
    //MARK: - Private method
   
    private func sendColorInSlider () {
        let color = CIColor(color: colorHomeScreen)
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1.0)
    }
    
    private func getString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}


//MARK: - Extention TextFeeldDelegate

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let inputText = textField.text else { return }
        guard var newValue = Float(inputText) else { return }
        
        if newValue > 1.0 {
            newValue = 1.0
        }
        
        switch textField {
        case redTextFeeld:
            redSlider.value = newValue
            redLabel.text = getString(from: redSlider)
        case greenTextFeeld:
            greenSlider.value = newValue
            greenLabel.text = getString(from: greenSlider)
        default:
            blueSlider.value = newValue
            blueLabel.text = getString(from: blueSlider)
        }
        
        textField.text = String(format: "%.2f", newValue)
        setViewColor()
    }
}
