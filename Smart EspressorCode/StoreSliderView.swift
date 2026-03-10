//
//  StoreSliderView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 5/9/23.
//

import SwiftUI

struct StoreSliderView: View {
    @State var first : Int
    @State var last : Int
    @State var text : String
    @State var lit : String
    @State var actual : Int = 0
    @State var tap : Bool = false
    @Binding var bind : Bool
    @Namespace private var namespace
    var body: some View {
        
        ZStack{
            
            if !tap{
                
                VStack{
                    
                    HStack{
                        Text(text)
                            .font(.title)
                            .padding(.leading,15)
                        // .frame(width: UIScreen.main.bounds.width)
                        Spacer()
                    }
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            ForEach(first..<last){ ok in
                                
                                ZStack{
                                    
                                    Rectangle()
                                        .frame(width: 100, height: 90)
                                        .cornerRadius(10)
                                        .padding(.trailing,5)
                                        .blur(radius: 6)
                                        . foregroundColor(Color(red: 3/255, green: 3/255, blue: 3/255))
                                        .opacity(0.5)
                                        .padding(.top,10)
                                        .zIndex(0)
                                        .zIndex(3)
                                    
                                    Rectangle()
                                        .frame(width: 100, height: 80)
                                        .cornerRadius(10)
                                        .padding(.trailing,5)
                                        .foregroundColor(.white)
                                        .zIndex(2)
                                    
                                    Image(String(lit + String(ok)))
                                        .resizable()
                                        .matchedGeometryEffect(id: String(ok), in: namespace)
                                        .frame(width: 100, height: 100)
                                        .padding(.trailing,4)
                                        .padding(.bottom, 30)
                                        .scaleEffect( (lit == "k") ?1.2 : 1)
                                       // .animation(.spring(response: 0.1,dampingFraction: 0.6))
                                        .zIndex(3)
                                       
                                       
                                    
                                }.onTapGesture {
                                  
                                    withAnimation(.spring(response: 0.5,dampingFraction: 0.6)) {
                                        actual = ok
                                        tap.toggle()
                                        bind.toggle()
                                    }
                                  
                                }
                                
                            }
                        }
                       // .animation(.spring(response: 0.5,dampingFraction: 0.8))
                        .padding(.leading, 15)
                        
                        
                    }
                    
                    
                    
                }
                
            }
            
            
            
            
            if tap {
                ZStack{

                  
                    
                    

                     
                    VStack{
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 38)
                                .frame(width:420,height:500)
                                .padding(.bottom,-25)
                                .foregroundColor(.black)
                                .blur(radius: 20)
                                .opacity(0.4)
                            RoundedRectangle(cornerRadius: 38)
                                .frame(width:410,height:500)
                                .padding(.bottom,-20)
                                .foregroundColor(.white)
                            Text("we have the best seller for your experience")
                                .padding(.bottom,250)
                               
                        }.animation(.spring(response: 0.5,dampingFraction: 0.8))
                    }
                    
                    Image(String(lit + String(actual)))
                        .resizable()
                        .matchedGeometryEffect(id: String(actual), in: namespace)
                        .frame(width: 300, height: 200)
                        .zIndex(3)

                }.transition(.move(edge: .bottom))

                    VStack{
                        HStack{
                            Button(){
                                withAnimation(.spring(response: 0.2,dampingFraction: 0.8)) {
                                    tap.toggle()
                                    bind.toggle()
                                    
                                }
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 27)
                                        .frame(maxWidth: 90,maxHeight:40)
                                        .padding(30)
                                        .padding(.horizontal, -3)
                                        .foregroundColor(.gray)
                                        .opacity(0.15)
                                    Text("cancel")
                                        .font(.title3)
                                }
                                
                                
                            }
                            Spacer()
                        }
                        Spacer()
                        Button(){
                            withAnimation(.spring(response: 0.2,dampingFraction: 0.8)) {
                                tap.toggle()
                                bind.toggle()
                                
                            }
                        }label: {
                            ZStack{

                                RoundedRectangle(cornerRadius: 27)
                                    .frame(maxWidth: .infinity,maxHeight:70)
                                    .padding(30)
                                    .padding(.horizontal, -3)
                                    .foregroundColor(.gray)
                                    .opacity(0.15)
                                Text("buy")
                                    .font(.title3)
                            }
                        

                        }
                  



                }.animation(.spring(response: 0.5,dampingFraction: 0.8))


            }
                    
                    
                    
                    
        }.padding(.bottom,50)
            
    }
}

struct StoreSliderView_Previews: PreviewProvider {
    static var previews: some View {
        StoreSliderView(first: 5, last: 12, text: "special edition", lit: "k", bind: .constant(false))
    }
}
