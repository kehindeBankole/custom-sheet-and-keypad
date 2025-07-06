//
//  Sheet.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 05/07/2025.
//
import SwiftUI

struct Sheet<Content: View>: View {
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 0
    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    let content: () -> Content
    
    var body: some View {
        ZStack{
            if isPresented {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .onTapGesture {
                
                        withAnimation {
                            isPresented = false
                        }
                    }
            }

            VStack(spacing: 0) {
                Image(systemName: "xmark")
                    .foregroundStyle(.appBodyBg)
                    .background(Circle().fill(.white).frame(width: 40 , height: 40))
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
         

                VStack {
                    content()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 40).fill(.appDarkBlue))
            }
            .offset(y: minHeight + offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let dragAmount = value.translation.height
    
                        if dragAmount > 0 {
                            offset = dragAmount
                        } else {
                            offset = dragAmount / 3
                        }
                    }
                    .onEnded { value in
                        let dragAmount = value.translation.height
                        if dragAmount > 300 {
                 
                            withAnimation {
                                isPresented = false
                                offset = 0
                            }
                        } else {
                            withAnimation {
                                offset = 0
                            }
                        }
                    }
            ) .animation(.snappy, value: offset)
        }
    }
}
