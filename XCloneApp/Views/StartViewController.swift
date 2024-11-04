//
//  StartViewController.swift
//  XCloneApp
//
//  Created by Kike Hernandez D. on 03/11/24.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFontNamesByFaily()
    }
    
    
    private func getFontNamesByFaily() {
        for family in UIFont.familyNames {
            debugPrint("-----------------FAMILY-------------------")
            for name in UIFont.fontNames(forFamilyName: family) {
                debugPrint("name: \(name)")
            }
            debugPrint("-----------------------------------------")
            debugPrint("")
            debugPrint("")
        }
    }

}
