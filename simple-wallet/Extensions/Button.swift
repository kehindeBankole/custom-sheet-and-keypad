//
//  Button.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 21/06/2025.
//

import SwiftUI


struct NoRippleButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.sensoryFeedback(.impact, trigger: configuration.isPressed)
    }
}

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        // Use a container to expand the tappable area
        configuration.label
            .font(.helveticNeueCyrMedium())
            .foregroundStyle(.appActionButtonBorder)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.appActionButtonBorder, lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.easeIn, value: true)
            .sensoryFeedback(.impact, trigger: configuration.isPressed)
      
    }
}


extension Button{
    func noRippleButton () -> some View {
        self.buttonStyle(NoRippleButtonStyle())
    }
    
    func actionButton () -> some View {
        self.buttonStyle(ActionButtonStyle())
    }
}
