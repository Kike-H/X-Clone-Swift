//
//  CustomButton.swift
//  XCloneApp
//
//  Created by Kike Hernandez D. on 03/11/24.
//

import UIKit

protocol CustomButtonDelegate {
    func actionButton(_ button: CustomButton)
}


@IBDesignable
class CustomButton: UIView {
    
    @IBOutlet weak var labelTitle: UILabel!
    
//    MARK: VARIABLES
    var delegte: CustomButtonDelegate?
    
//    MARK: ACTIONS
    @IBAction func actionButton(_ sender: Any) {
        self.delegte?.actionButton(self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let content = UINib(nibName: "CustomButton", bundle: nil).instantiate(withOwner: self).first as? UIView {
            content.frame = bounds
            content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            content.translatesAutoresizingMaskIntoConstraints = true
            self.addSubview(content)
        }
    }
    
    func configure(isFilled: Bool = true, cornerRadius: CGFloat = 25.0, title: String) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        self.labelTitle.text = title
    }
    
    
    
    
    
}
