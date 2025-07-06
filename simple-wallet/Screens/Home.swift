//
//  Home.swift
//  simple-wallet
//
//  Created by Kehinde Bankole on 21/06/2025.
//

import SwiftUI

let numbers = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9", "." , "0" , "x"]

struct Home: View {
    @State private var showSheet = false;
    @State private var amount = "0"
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .center, spacing : 48){
                    HStack{
                        HStack(alignment : .center, spacing : 24){
                            
                            Button(action:{
                                
                            } ){
                                Image("hamburger")
                                    .foregroundStyle(.appRed)
                                    .background(Circle().fill(.appButtonBlue)   .frame(width: 48 , height: 48))
                                
                                
                                
                            }.noRippleButton()
                            
                            Text("Hello Sandra")
                                .font(.helveticNeueCyrMedium(size: 20))
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal , 16)
                        Spacer()
                        Button(action: {
                            
                        }){
                            Text("Add money").font(.helveticNeueCyrMedium(size: 14))
                                .padding(.vertical , 4)
                                .padding(.horizontal , 8)
                                .foregroundStyle(.appLightBlue)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.appButtonBlue))
                        }.noRippleButton()
                    }
                    .padding(16)
                    VStack(spacing : 32){
                        VStack(alignment: .leading, spacing : 16){
                            Group{
                                Text("Your current balance is").font(.helveticNeueCyrRoman(size: 12))
                                Text(200_000, format: .currency(code: "NGN"))
                                    .font(.helveticNeueCyrBold(size: 40))
                            }.foregroundStyle(.white)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        HStack(spacing: 15){
                            Button(action: {
                                
                            }){
                                Text("Request money")
                            }.actionButton()
                            Button(action: {
                                withAnimation(.snappy){
                                    showSheet.toggle()
                                }
                            }){
                                Text("Send money")
                            }.actionButton()
                        }
                    }.padding(.horizontal , 16)
                }
                Spacer()
                
            }
            if(showSheet){
                Sheet(isPresented: $showSheet) {
                    
                    
                    VStack(spacing : 80) {
                        
                        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
                        //
                        Text(Double(amount) ?? 0 , format: .currency(code: "NGN"))
                            .font(.helveticNeueCyrBold(size: amount.count > 6 ? 48 : 64))
                            .foregroundStyle(.white)
                        
                        
                        LazyVGrid(columns: columns , spacing: 65 ){
                            ForEach(numbers , id:\.self){num in
                                Button(action: {
                                    
                                    
                                    
                                    if(num == "x"){
                                        if(amount.count == 1){
                                            amount = "0"
                                        }else{
                                            amount = String(amount.dropLast())
                                        }
                                        
                                    }else{
                                        
                                        if(amount == "0"){
                                            amount = num
                                        }else{
                                            amount += num
                                        }
                                        
                                    }
                                    
                                    
                                }){
                                    Group{
                                        if(num == "x") {
                                            Image(systemName: "delete.backward")
                                        }else{
                                            Text(num)
                                        }
                                    }   .font(.helveticNeueCyrBold(size: 32))
                                        .foregroundStyle(.white)
                                }.noRippleButton()
                            }
                        } 
                    }
                    .padding(.top , 72)
                    .frame(maxWidth: .infinity)
                    
                }.transition(.move(edge: .bottom))
            }
        }
    }
}

#Preview {
    Home().background(Color.appBodyBg)
}
