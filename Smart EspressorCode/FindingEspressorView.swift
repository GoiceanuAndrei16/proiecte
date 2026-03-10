//
//  FindingEspressor.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 1/2/23.
//

import SwiftUI

struct FindingEspressorView: View {
    @Binding var connect : Bool
    @Binding var wasFound : Bool
    @State var exitAnimation : Bool = false
    var body: some View {
        ZStack{
            
            
            
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.clear)
                .background(.thinMaterial)
            
            if !wasFound{
                
                LottieView(lottieFile: "loading", loop: true)
                    .blur(radius: 30)
                    .scaleEffect(1.4)
                    .padding(.bottom, 70)
                
            }
                
                ZStack{
                    
                    Circle()
                        .foregroundColor(.brown)
                        .scaleEffect(exitAnimation ?5 : wasFound ?0.8 : 0)
                        .blur(radius: wasFound ?30 : 100)
                        .opacity(exitAnimation ?0 : 1)

                    
                    Circle()
                        .foregroundColor(.green)
                        .scaleEffect(exitAnimation ?5 : wasFound ?0.79 : 0)
                        .blur(radius: wasFound ?20 : 100)
                        .opacity(exitAnimation ?0 : 1)
                    
                }
            
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.clear)
                .background(.ultraThinMaterial)
                .opacity(0.5)
            
            
            if !wasFound{
                
            LottieView(lottieFile: "loading", loop: true)
                .scaleEffect(0.7)
                .transition(.scale)
            
            
            VStack{
                
                
                Text("Tap Pair on Your Espressor \n Screen to Connect")
                    .font(.title)
                    .frame(height: 400)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Text("Hold device close to the Espressor \n and wait to Connect")
                    .font(.title3)
                    .frame(height: 200)
                    .multilineTextAlignment(.center)
                
                Button(){
                    withAnimation() {
                        connect.toggle()
                    }
                }label: {
                    Text("or set up manualy ")
                        .frame(height: 20)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                        .foregroundColor(.secondary)
                }
            }
        }
            if exitAnimation {
                Text("Devices Paired \n Successfully ")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .transition(.scale)
                    .animation(.easeInOut)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.spring(response: 0.7, dampingFraction: 0.3)){
                                
                                connect.toggle()
                            }
                        }
                        
                    }
            }
        
        
        
            
        }.onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.3)){
                wasFound.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.spring(response: 0.7, dampingFraction: 0.3)){
                        exitAnimation.toggle()
                    }
                }
            }
        }
        
        
        
    }
}

struct FindingEspressorView_Previews: PreviewProvider {
    static var previews: some View {
        FindingEspressorView(connect: .constant(true), wasFound: .constant(true))
    }
}
