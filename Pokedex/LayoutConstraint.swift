//
//  LayoutConstraint.swift
//  Pokedex
//
//  Created by Fabio Cipriani on 25/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import UIKit

@IBDesignable
class LayoutConstraint: NSLayoutConstraint {
    @IBInspectable
    var 📱3¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 480 {
                constant = 📱3¨5_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨0_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 568 {
                constant = 📱4¨0_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨7_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 667 {
                constant = 📱4¨7_insh
            }
        }
    }
    
    @IBInspectable
    var 📱5¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 736 {
                constant = 📱5¨5_insh
            }
        }
    }
}
