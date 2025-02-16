//
//  UIApplication+HideKeyboard.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 16.02.2025.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
