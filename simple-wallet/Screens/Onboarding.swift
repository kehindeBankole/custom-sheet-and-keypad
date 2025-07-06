//
//  Onboading.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 15/06/2025.
//

// Onboading.swift

import SwiftUI

struct OnboardModel: Identifiable, Hashable {
    let id = UUID()
    let bg: String
    let title: String
    let subtitle: String
    let cardBg: Color
    let primaryColor: Color
}

let onboardingData = [
    OnboardModel(bg: "onboard-1", title: "Transfer That Is Safe", subtitle: "You have nothing to be scared about, we got you covered.", cardBg: Color.appBlue, primaryColor : Color.white),
    OnboardModel(bg: "onboard-2", title: "Transfer Money With Ease", subtitle: "Making money is hard enough, we make transfering it easy enough.", cardBg: Color.white, primaryColor: Color.appDarkBlue)
]


struct Onboarding: View {
    @State private var currentSelection: UUID = onboardingData[0].id
    @AppStorage("showOnboarding") private var showOnboarding: Bool = true
    
    var body: some View {
        TabView(selection: $currentSelection) {
            ForEach(onboardingData) { item in
         
                ZStack(alignment: .bottomLeading) {
                    Image(item.bg)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    VStack{
                        VStack(alignment:.leading , spacing: 16) {
                            Group{
                                Text(item.title)
                                    .font(.stolzBold(size: 18))
                                
                                    
                                Text(item.subtitle)
                                    .font(.helveticNeueCyrRoman())
                                    .lineSpacing(8)
                            }.foregroundStyle(item.primaryColor)
                            Button(action: {
                     
                                    showOnboarding = false
                
                            }){
                                Text("Start banking")
                                    .font(.helveticNeueCyrMedium())
                                    .foregroundStyle(item.cardBg)
                                    .padding(.vertical , 12)
                                    .padding(.horizontal , 23)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(item.primaryColor))
                            }.noRippleButton()
                        }
                        .padding(.top , 32)
                        .padding(.bottom , 32)
                        .padding(.trailing , 45)
                        .padding(.leading , 32)
                        
                        .background(
                            Rectangle().fill(item.cardBg).clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 70, style: .circular))
                        )
                    }.padding(.trailing , 52)
                }
                .tag(item.id)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    Onboarding()
}
