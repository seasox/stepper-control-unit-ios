//
//  Color+hex.swift
//  StepperControl (iOS)
//
//  Created by Jeremy Boy on 20.03.21.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        self.init(
            red:   Double((rgb & 0xFF0000) >> 16)/255.0,
            green: Double((rgb &   0xFF00) >>  8)/255.0,
            blue:  Double((rgb &     0xFF)      )/255.0)
    }
}
