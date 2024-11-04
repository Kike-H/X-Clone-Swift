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
    @IBOutlet weak var buttonCreateAccount: CustomButton!
    @IBOutlet weak var termsAndConditionLabel: UILabel!
    @IBOutlet weak var logInLabel: UILabel!
    
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
        
        self.buttonCreateAccount.configure(title: "Create account")
        self.buttonCreateAccount.delegte = self
        
        
//        CONFIGURE ACTIONS TERMS LABEL
        let tapGestureTerms = UITapGestureRecognizer(target: self, action: #selector(handleTapTerms(_:)))
        self.termsAndConditionLabel.addGestureRecognizer(tapGestureTerms)
        self.termsAndConditionLabel.isUserInteractionEnabled = true
        
        let tapGestureLogIn = UITapGestureRecognizer(target: self, action: #selector(handleTapLogIn(_:)))
        self.logInLabel.addGestureRecognizer(tapGestureLogIn)
        self.logInLabel.isUserInteractionEnabled = true
        
    }
    
    @objc private func handleTapTerms(_ gesture: UITapGestureRecognizer) {
        let baseText = self.termsAndConditionLabel.text ?? self.termsAndConditionLabel.attributedText?.string ?? ""
        
        let termsRange = (baseText as NSString).range(of: "Terms")
        let privacyPolicyRange = (baseText as NSString).range(of: "Privacy Policy")
        let cookieUseRange = (baseText as NSString).range(of: "Cookie Use")
        
        let tapLocation = gesture.location(in: self.termsAndConditionLabel)
        let textBoundingBox = self.termsAndConditionLabel.attributedText?.boundingRect(with: self.termsAndConditionLabel.bounds.size, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        
        guard let boundingBox = textBoundingBox else { return }
        
        // Ajusta las áreas de toque según el texto mostrado en el UILabel
        if tapLocationInRange(tapLocation, range: termsRange, label: self.termsAndConditionLabel) {
            print("Terms tapped")
            // Acción para Terms
        } else if tapLocationInRange(tapLocation, range: privacyPolicyRange, label: self.termsAndConditionLabel) {
            print("Privacy Policy tapped")
            // Acción para Privacy Policy
        } else if tapLocationInRange(tapLocation, range: cookieUseRange, label: self.termsAndConditionLabel) {
            print("Cookie Use tapped")
            // Acción para Cookie Use
        }
        if tapLocation.x >= boundingBox.minX && tapLocation.x <= boundingBox.maxX && tapLocation.y >= boundingBox.minY && tapLocation.y <= boundingBox.maxY {
        }
        
    }
    
    @objc private func handleTapLogIn(_ gesture: UITapGestureRecognizer) {
        let baseText = self.logInLabel.text ?? self.logInLabel.attributedText?.string ?? ""
        
        let logInRange = (baseText as NSString).range(of: "Log in")

        
        let tapLocation = gesture.location(in: self.logInLabel)
        let textBoundingBox = self.logInLabel.attributedText?.boundingRect(with: self.logInLabel.bounds.size, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        
        guard let boundingBox = textBoundingBox else { return }
        
        // Ajusta las áreas de toque según el texto mostrado en el UILabel
        if tapLocation.x >= boundingBox.minX && tapLocation.x <= boundingBox.maxX && tapLocation.y >= boundingBox.minY && tapLocation.y <= boundingBox.maxY {
            if tapLocationInRange(tapLocation, range: logInRange, label: self.logInLabel) {
                debugPrint("Log In tapped")
            }
        }
        
    }
    
    
    private func tapLocationInRange(_ location: CGPoint, range: NSRange, label: UILabel) -> Bool {
            let textStorage = NSTextStorage(attributedString: label.attributedText!)
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: label.bounds.size)
            
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
            
            textContainer.lineFragmentPadding = 0
            textContainer.maximumNumberOfLines = label.numberOfLines
            textContainer.lineBreakMode = label.lineBreakMode
            
            let glyphRange = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
            let boundingRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
            
            return boundingRect.contains(location)
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

extension StartViewController: CustomButtonDelegate {
    func actionButton(_ button: CustomButton) {
        debugPrint("Hello world")
    }
}
