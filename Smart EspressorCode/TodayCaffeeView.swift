//
//  TodayCaffeeView.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 1/4/23.
//

import SwiftUI

struct TodayCaffeeView: View {
    @Binding var PreparePopUpVar : Bool
    @State var info : Bool = false
    @Namespace var namespace
    @Binding var VectorFavorite : [Bool]
    
    var body: some View {



            ZStack{
                
                Color("Appearance")
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    ZStack{
                        
                        VStack{
                            Image("TodayBest")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.height/1.7, height: UIScreen.main.bounds.height/1.7)
                            
                            Color("Appearance")
                                .padding(.top, -130)
                                .blur(radius: 50)
                                .frame(width: UIScreen.main.bounds.height*1.1, height: UIScreen.main.bounds.height/2)
                        }
                        
                        VStack{
                            
                            Text("Today Coffee")
                                .font(.largeTitle)
                                .padding(.top, 20)
                                .padding(.bottom, 5)
                                .scaleEffect(1.3)
                            
                            HStack{
                                
                                Text("Rich Aroma  -")
                                Text("Stong  -")
                                Text("Wakeful")
                            }.scaleEffect(0.8)
                            
                            HStack{
                                
                                Button{
                                    VectorFavorite[5].toggle()
                                }label: {
                                    Text("+ \n My List")
                                        .frame(width: 90, height: 50)
                                    // .background(Color.red)
                                        .foregroundColor(.secondary)
                                    
                                }
                                Button{
                                    PreparePopUpVar.toggle()
                                }label: {
                                    Text("|> Prepare ")
                                        .foregroundColor(.green)
                                        .frame(width: 100, height: 40)
                                        .background(.ultraThinMaterial)
                                    // .background(Color.black)
                                        .cornerRadius(14)
                                        .padding(.horizontal, 20)
                                    
                                }
                                
                                if !info {
                                    Button{
                                        withAnimation(.spring(response: 0.9,dampingFraction: 0.9)) {
                                            info.toggle()
                                            
                                        }
                                    }label: {
                                        Image(systemName: "info.circle")
                                            .scaleEffect(1.2)
                                            .matchedGeometryEffect(id: "ok", in: namespace)
                                            .frame(width: 75, height: 40)
                                            .foregroundColor(.secondary)
                                           
                                            .cornerRadius(15)
                                    }
                                      
                                }
                                else{




                                        VStack{
                                                  
                                                    ZStack{

                                                                RoundedRectangle(cornerRadius: 60)
                                                                 .background(.ultraThinMaterial)
                                                                 .cornerRadius(50)
                                                                    .matchedGeometryEffect(id: "ok", in: namespace)
                                                                    .frame(width:350,height: 350)
                                                                    .foregroundColor(.secondary)

                                                                VStack{
                                                                            Text("Salted Alama Choc")
                                                                                .font(.title)

                                                                            Text("With caramel sauce, almonds and coconut together with the bitter taste of coffee")
                                                                } .frame(width: 340,height: 400)
                                                                    .matchedGeometryEffect(id: "ok", in: namespace)
                                                                
                                                                
                                                               

                                                    }.onTapGesture {     withAnimation(.spring(response: 1,dampingFraction: 0.9)) {      info.toggle()       }        }

                                                    
                                            
                                         
                                        }.padding(.top,-410)
                                        .padding(.leading,-250)
                                        
                                       // Spacer()
                                    


                                }//else
                                
                            }
                            
                        }//vstack
                        
                    }//zstack
                    
                }//vstack
                
                
                    
                  
                      
                    
                
                
            }.frame(maxHeight: UIScreen.main.bounds.height/2)
        
        
        

    }
}

struct TodayCaffeeView_Previews: PreviewProvider {
    static var previews: some View {
        TodayCaffeeView(PreparePopUpVar: .constant(false), VectorFavorite: .constant([true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false]))
    }
}
