//
//  ButtonLogSN.swift
//  XCloneApp
//
//  Created by Kike Hernandez D. on 03/11/24.
//

import UIKit

enum ButtonLogSNType: String {
    case apple = "apple"
    case google = "google"
}

protocol ButtonLogSNDelegate: AnyObject {
    func actionButton(type: ButtonLogSNType)
}

@IBDesignable
final class ButtonLogSN: UIView {
    
//    MARK: @IBOutlets
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
//   MARK: Variables
    var type: ButtonLogSNType = .apple
    
    var delegate: ButtonLogSNDelegate?
    
    
//    MARK: ACTION BUTTON
    @IBAction func actionButton(_ sender: Any) {
        self.delegate?.actionButton(type: self.type)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let content = UINib(nibName: "ButtonLogSN", bundle: nil).instantiate(withOwner: self).first as? UIView {
            content.frame = bounds
            content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            content.translatesAutoresizingMaskIntoConstraints = true
            self.setup()
            self.addSubview(content)
        }
    }
    
    private func setup() {
        self.layer.cornerRadius = 25.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
    }
    
    func configureButton() {
        let baseTxt = "Continue with"
        self.labelTitle.text = "\(baseTxt) \(self.type.rawValue.capitalized)"
        self.icon.image = UIImage(named: self.type.rawValue.capitalized)
    }
    
    
}

