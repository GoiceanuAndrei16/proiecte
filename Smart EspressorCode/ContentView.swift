//
//  ContentView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 12/24/22.
//

import SwiftUI

struct ContentView: View {
    @State var  connect : Bool = false
    @State var  espressorWasFound : Bool = false
    @State var triggerAnimation : Bool = false
    @State var showEspressor : Bool = false
    @Namespace var namespace

    @Environment(\.colorScheme) var colorScheme
    var body: some View {
            ZStack{
                
                Color(triggerAnimation ?.white : .black)
                    .zIndex(0)
                    .ignoresSafeArea()
              
                    if colorScheme == .light {
                        LottieView(lottieFile: "StartupW")
                            .padding(.bottom, -220)
                            .blur(radius: connect ?60 : 0)
                            .zIndex(1)
                            .opacity(showEspressor ?0 : 1)
                    }
                    else{
                        LottieView(lottieFile: "StartupD")
                            .padding(.bottom, -220)
                            .blur(radius: connect ?60 : 0)
                            .zIndex(1)
                            .opacity(showEspressor ?0 : 1)
                    }
                
                if !connect && espressorWasFound && !showEspressor{
                    ProgressView()
                        .scaleEffect(2.5)
                        .zIndex(10)
                        .padding(.bottom, 50)
                }
                
                
                if !espressorWasFound {
                    LoginView(connect: $connect)
                        .zIndex(2)
                }
                
                
                if connect {
                        FindingEspressorView(connect: $connect , wasFound: $espressorWasFound )
                            .cornerRadius(47)
                            .zIndex(5)
                            .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
                            .animation(.spring(response: 0.7, dampingFraction: 1))
                            .onChange(of: espressorWasFound) { value in GetSmaller()}
                            .ignoresSafeArea()
                }
                    
                if showEspressor{
                    if !triggerAnimation {
                        ZStack{
                            if colorScheme == .light {
                                LottieView(lottieFile: "GetSmallerW")
                                    .matchedGeometryEffect(id: "ok", in: namespace)
                                    .padding(.bottom, -220)
                                    .zIndex(1)
                            }else{
                                LottieView(lottieFile: "GetSmallerD")
                                    .matchedGeometryEffect(id: "ok", in: namespace)
                                    .padding(.bottom, -220)
                                    .zIndex(1)
                            }
                            
                        }.zIndex(7)
                        
                    }else{
                        
                        ZStack{
                            
                            HomeView()
                                
                            
                            LottieView(lottieFile: "GetSmallerW")
                                .matchedGeometryEffect(id: "ok", in: namespace)
                                .padding(.bottom, UIScreen.main.bounds.height - 150)
                                .padding(.trailing, UIScreen.main.bounds.width - 100)
                                .padding(.leading,  1)
                                .zIndex(1)
                                .opacity(0)
                               
                                
                        }
                        
                    }
                   
                    
                        
     
                    }
                    
                
                
            }
            
           
            
            
          
        
    }
    
    func GetSmaller() -> Void{
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            showEspressor.toggle()
            withAnimation(.easeInOut(duration: 1).delay(0.5)) {
                triggerAnimation.toggle()

            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
