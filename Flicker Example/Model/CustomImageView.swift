//
//  CustomImageView.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 12.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

@IBDesignable class CustomImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        //clipsToBounds = true
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }

}
