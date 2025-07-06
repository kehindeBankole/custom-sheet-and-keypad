//
//  ContentView.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 31/05/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showOnboarding") private var showOnboarding: Bool = true
    
    var body: some View {
        VStack{
            if(showOnboarding) {
                Onboarding()
            }else{
                Home()
            }
        }
    }
}

#Preview {
    ContentView()
}
