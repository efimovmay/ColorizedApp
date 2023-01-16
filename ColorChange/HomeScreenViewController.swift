//
//  HomeScreenViewController.swift
//  ColorizedApp
//
//  Created by Aleksey on 15.01.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackground(_ newColorBackground: UIColor)
}

class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorHomeScreen = view.backgroundColor
        settingsVC.delegate = self
    }
}

//MARK: - SettingsViewControllerDeligate

extension HomeScreenViewController: SettingsViewControllerDelegate {
    func setNewBackground(_ newColorBackground: UIColor) {
        view.backgroundColor = newColorBackground
    }
}
