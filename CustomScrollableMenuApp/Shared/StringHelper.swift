//
//  StringHelper.swift
//  TestScrollApp
//
//  Created by Elizaveta Rudenko on 29.11.2021.
//

import UIKit

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        sizeOfString(usingFont: font).width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        sizeOfString(usingFont: font).height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
