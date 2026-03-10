//
//  LoginView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 1/2/23.
//

import SwiftUI

struct LoginView: View {
    @State var  userName = ""
    @Binding var  connect : Bool 
  
    var body: some View {
        
        VStack{
            Spacer()
            //
           
                Text("Control Your")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .scaleEffect(1.1)
                    .padding(30)
                    .frame(width: 400, height: 30, alignment: .leading)
                
                
                
                Text("Morning ")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .scaleEffect(1.5)
                    .padding(30)
                    .frame(width: 400, height: 30, alignment: .center)
           
              
//            Spacer()
           
            ZStack{
      
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .blur(radius: 1)
                        .frame(maxWidth: 500, maxHeight:60)
                        .cornerRadius(17)
                        .padding(20)
                        
                    TextField("User Name", text: $userName)
                        .background(Color.clear)
                        .padding(35)
                        
                    
            }.frame(height: 100, alignment: .bottom)
                .frame( height: 440, alignment: .bottom)
                .padding(.bottom, 35)
                
                
            Button(){
                // ask espressor to connect
                withAnimation {
                    connect.toggle()
                        
                }
            }label: {
                ZStack{
                    
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .blur(radius: 1)
                        .frame(maxWidth: 500, maxHeight: 60)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                    
                    Text("Connect")
                        .foregroundColor(.secondary)
                        .opacity(0.8)
                    
                }.foregroundColor(.clear)
                    .padding(.bottom,100)
            }
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView( connect: .constant(false))
    }
}
