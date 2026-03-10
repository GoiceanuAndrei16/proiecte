//
//  YourListView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 4/15/23.
//

import SwiftUI

struct YourListView: View {
    @Binding var VectorFavorite : [Bool]
    @State var showAll : Bool = false
    @State var close : Bool = false
    @State var coffeeNrStart: Int
    @State var coffeeNrEnd: Int
    @State var type : String
    @Binding<Int> var exit : Int
    @Binding var preppopup : Bool
    @State var prefix : String = "a"
    @Namespace private var namespace
    var body: some View {
        ZStack{
            if !showAll{
                VStack{
                    HStack{
                        Text("Saved")
                            .scaleEffect(1.3)
                            .padding()
                            .padding(.leading, -50)
                            .frame(width: 150, height: 20)
                        
                        
                        Spacer()
                        Button{
                            showAll.toggle()
                            close = true
                        }label: {
                            Text("show all")
                                .foregroundColor(.gray)
                            .frame(width: 100, height: 20)                }
                        .scaleEffect(1.1)
                        .padding()
                        .padding(.leading, 5)
                        
                        
                    }
                    
                    
                    
                    
                    
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack{
                                           
                                            ForEach(coffeeNrStart..<coffeeNrEnd){ ok in
                                                if (VectorFavorite[ok]){
                                                    ZStack{
                                                        
                                                        Rectangle()
                                                            .frame(width: 110, height: 110)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                        
                                                        Rectangle()
                                                            .frame(width: 100, height: 100)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                            .foregroundColor(.white)
                                                        
                                                        Image(String("c" + String(ok)))
                                                            .resizable()
                                                            .frame(width: 50, height: 90)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                        
                                                        
                                                    }.matchedGeometryEffect(id: String(ok), in: namespace)
                                                        .onTapGesture {
                                                            exit = ok
                                                            preppopup.toggle()
                                                        }
                                                    
                                                }
                                            }
                                        }
                                        //.animation(.spring(response: 2,dampingFraction: 0.8))
                                        .padding(.leading, 15)
                                        .frame(height: close ?320 : 120)
                                   
                                    }
                                   // .frame(width: UIScreen.main.bounds.width)
                    
                }
                    .animation(.spring())
                
                
                
            }
            
            if showAll {
                
                VStack{
                    HStack{
                        Text(type)
                            .scaleEffect(1.1)
                            .padding()
                            .padding(.leading, -60)
                            .frame(width: 150, height: 20)
                        
                        
                        Spacer()
                        Button{
                            showAll.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                withAnimation(.easeInOut(duration: 1)) {
                                    close = false
                                        
                                }
                            }
                            
                        }label: {
                            Text("show less")
                                .foregroundColor(.gray)
                            .frame(width: 100, height: 20)                }
                        .scaleEffect(1.1)
                        .padding()
                        .padding(.leading, 5)
                        
                        
                    }
                    
                                        VStack{
                   
                                            ForEach(coffeeNrStart..<coffeeNrEnd){ ok in
                                                if (VectorFavorite[ok]){
                                                    ZStack{
                                                        Rectangle()
                                                            .frame(width: 110, height: 110)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                        
                                                        Rectangle()
                                                            .frame(width: 100, height: 100)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                            .foregroundColor(.white)
                                                        
                                                        Image(String("c" + String(ok)))
                                                            .resizable()
                                                            .frame(width: 50, height: 90)
                                                            .cornerRadius(10)
                                                            .padding(.trailing,5)
                                                        
                                                        
                                                        
                                                    }.matchedGeometryEffect(id: String(ok), in: namespace)
                                                        .padding(.leading, (ok%2==0 && coffeeNrStart%2 != 0) ?150 : -150)
                                                        .padding(.top,(ok%2==0 && coffeeNrStart%2 != 0) ?(-120): 0)
                                                        .padding(.leading, (ok%2 != 0 && coffeeNrStart%2 == 0) ?350 : 0)
                                                        .padding(.top,(ok%2 != 0 && coffeeNrStart%2 == 0) ?(-120): 0)
                                                        .onTapGesture {
                                                            exit = ok
                                                            preppopup.toggle()
                                                        }
                                                }
                                            }
                                        }.padding(.leading, 15)
                    
                    
                }
                    .animation(.spring())
                   // .frame(width: 400, height:300)
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
               
         
          

    }
}

struct YoulistView_Previews: PreviewProvider {
    static var previews: some View {
        YourListView(VectorFavorite: .constant([true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false]), coffeeNrStart: 1, coffeeNrEnd: 14, type: "nil", exit: .constant(1), preppopup: .constant(true))
    }
}
