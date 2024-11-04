//
//  StartViewController.swift
//  XCloneApp
//
//  Created by Kike Hernandez D. on 03/11/24.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonGoogle: ButtonLogSN!
    @IBOutlet weak var buttonApple: ButtonLogSN!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
//        self.getFontNamesByFaily()
    }
    
    
    private func setup() {
        
//        MARK: BUTTONS
        self.buttonGoogle.type = .google
        self.buttonGoogle.delegate = self
        self.buttonGoogle.configureButton()
        
        self.buttonApple.type = .apple
        self.buttonApple.delegate = self
        self.buttonApple.configureButton()
        
        
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

extension StartViewController: ButtonLogSNDelegate {
    func actionButton(type: ButtonLogSNType) {
        debugPrint("Hello: \(type.rawValue)")
    }
}