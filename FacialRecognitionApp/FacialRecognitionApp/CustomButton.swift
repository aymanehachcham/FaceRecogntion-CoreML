//
//  CustomButton.swift
//  FaceMask
//
//  Created by aymane hachcham on 5/9/21.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    let screenSize = UIScreen.main.bounds
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 6/UIScreen.main.nativeScale
        layer.backgroundColor = UIColor(red:0.24, green:0.51, blue:1.00, alpha:1.0).cgColor
        setTitleColor( .white, for: .normal)
        
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.borderWidth = 6/UIScreen.main.nativeScale
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = true
        
        let buttonWidth = self.frame.width
        let imageWidth = 35
        let spacing = 16
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth - CGFloat(spacing + imageWidth + 70), bottom: 0, right: CGFloat(-spacing))
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(-imageWidth/6), bottom: 0, right: CGFloat(imageWidth/6))
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been initiliazed")
    }
}

extension UIImage {
    
    func resized(newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {return nil}
        UIGraphicsEndImageContext()
        return resizedImage
        
    }
}

