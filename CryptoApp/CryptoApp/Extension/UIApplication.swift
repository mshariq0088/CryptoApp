//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Mohammad Shariq on 28/06/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
