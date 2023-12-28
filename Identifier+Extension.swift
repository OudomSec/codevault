//
//  Identifier+Extension.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 12/9/23.
//

import UIKit

protocol Identifier {
    /// ID view
    static var identifierView: String {get}

    /// XIB - init XIB from identifierView
    static func xib() -> UINib?
}

extension UIView: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
}
