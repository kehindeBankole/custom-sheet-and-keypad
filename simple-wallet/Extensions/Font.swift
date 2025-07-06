//
//  Font.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 21/06/2025.
//

import SwiftUI

extension Font {
    static func stolzBold (size : CGFloat = 16) -> Font {
        .custom("Stolzl-Bold", size: size)
    }
    
    static func helveticNeueCyrRoman (size : CGFloat = 16) -> Font {
        .custom("HelveticaNeueCyr-Roman", size: size)
    }
    
    static func helveticNeueCyrMedium (size : CGFloat = 16) -> Font {
        .custom("HelveticaNeueCyr-Medium", size: size)
    }
    
    static func helveticNeueCyrBold (size : CGFloat = 16) -> Font {
        .custom("HelveticaNeueCyr-Bold", size: size)
    }
    
}
