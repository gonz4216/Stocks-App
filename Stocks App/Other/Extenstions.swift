//
//  Extenstions.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-11.
//

import UIKit


//MARK: - Framing

extension UIView {
    var  width: CGFloat {
        frame.size.width
    }
    var  height: CGFloat {
        frame.size.height
    }
    var  left: CGFloat {
        frame.origin.x
    }
    var  right: CGFloat {
        left + width
    }
    var  top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        top + height
    }
}
